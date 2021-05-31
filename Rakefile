require 'rake'
require 'open-uri'
require 'json'
require 'vonage'

require File.expand_path('../app/available_sessions/schedule_with_pin_codes.rb', __FILE__)
require File.expand_path('../app/available_sessions/schedule_with_city.rb', __FILE__)
CONFIG = JSON.parse(File.read('./config.json'))

namespace :covin do
  desc 'Send alerts for all available appointments'
  task :check_available_slots do
    ScheduleWithPinCodes.new(CONFIG).process
  end

  desc 'Send alerts for all available appointments'
  task :check_available_slots_for_the_city do
    ScheduleWithCity.new(CONFIG).process
  end
end
