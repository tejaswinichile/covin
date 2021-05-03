require 'rake'
require 'open-uri'
require 'json'
namespace :covin do

  desc 'Send alerts for all available appointments'
  task :check_available_slots do
    system('say "check in progress"')
    date = Date.today.strftime("%d-%m-%Y")
    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416235&date=#{date}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end

    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416005&date=#{date}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end

    tomorrow = date = (Date.today + 1).strftime("%d-%m-%Y")
    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416235&date=#{tomorrow}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end

    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416005&date=#{tomorrow}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end


    day_after_tomo = date = (Date.today + 2).strftime("%d-%m-%Y")
    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416235&date=#{day_after_tomo}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end

    response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416005&date=#{day_after_tomo}").read
    sessions = JSON.parse(response) # {sessions: []}
    puts "#{sessions}"
    if sessions["sessions"].any?
      system('say "beep"')
    end
  end
end

