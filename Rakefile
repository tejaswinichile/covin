require 'rake'
require 'open-uri'
require 'json'
require 'vonage'


PIN_CODES = %w[416235 416005 416119 416216 416103 416207].freeze

def sms_alert_config
  @client = Vonage::Client.new(
    api_key: "c9616804",
    api_secret: "InQVWznLWoV675uW"
  )
end

def slot_available?(pin:, date:)
  available_slots = []
  age_limit = 18

  response = URI.open(
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=#{pin}&date=#{date}"
  ).read
  sessions = JSON.parse(response)
  available_sessions = sessions['sessions']

  puts sessions.to_s

  if available_sessions.any?
    available_sessions.each do |session|
      if session['min_age_limit'] == age_limit
        system("say slot available at #{pin}")
        available_slots << { pin: pin, vaccine_name: session['vaccine'] }
      end
    end
  end

  # add your number at to
  if available_slots.any?
    sms_alert_config
    @client.sms.send(
      from: "vaccine slot available alert",
      to: "91**********",
      text: "slot available at #{available_slots.join(',')}"
    )
  end
end

namespace :covin do
  desc 'Send alerts for all available appointments'
  task :check_available_slots do

    system("say check in progress")

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

      # after 3 days
      date = (Date.today + 3).strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)

      # after 7 days
      date = (Date.today + 7).strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)
    end
  end
end
