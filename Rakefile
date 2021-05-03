require 'rake'
require 'open-uri'
require 'json'

PIN_CODES = %w[416235 416005].freeze

def slot_available?(pin:, date:)
  response = open(
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=#{pin}&date=#{date}"
  ).read
  sessions = JSON.parse(response)
  puts sessions.to_s

  system('say "beep"') if sessions['sessions'].any?
end

namespace :covin do
  desc 'Send alerts for all available appointments'
  task :check_available_slots do
    PIN_CODES.each do |pin_code|
      # Today
      date = Date.today.strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)

      # Tomorrow
      date = (Date.today + 1).strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)

      # Day after tomorrow
      date = (Date.today + 2).strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)
    end
  end
end
