class ScheduleWithCity

  attr_reader :age_limit, :district_id

  def initialize(config)
    @age_limit = config['age_limit']
    @district_id = config['district_id']
  end

  def process
    system("say check in progress for the city")

      # Today
    # date = Date.today.strftime('%d-%m-%Y')
    # slot_available?(date: date)

    # Tomorrow
    date = (Date.today + 1).strftime('%d-%m-%Y')
    slot_available?(date: date)

    # Day after tomorrow
    date = (Date.today + 2).strftime('%d-%m-%Y')
    slot_available?(date: date)

    # after 3 days
    date = (Date.today + 3).strftime('%d-%m-%Y')
    slot_available?(date: date)

    # after 4 days
    date = (Date.today + 4).strftime('%d-%m-%Y')
    slot_available?(date: date)

    # after 5 days
    date = (Date.today + 5).strftime('%d-%m-%Y')
    slot_available?(date: date)
  end

  def slot_available?(date:)
    available_slots = []

    response = URI.open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=#{district_id}&date=#{date}",
    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51").read

    sessions = JSON.parse(response)
    available_sessions = sessions['sessions']

    puts sessions.to_s

    if available_sessions.any?
      system("available sessions")
      available_sessions.each do |session|
        if session['min_age_limit'] == age_limit &&
           session['available_capacity'] > 0
          pin_to_say = session['pincode'].to_s.split('').join(' ')
          system("say slot available at #{pin_to_say}")
          available_slots << { pin: session['pincode'], vaccine_name: session['vaccine'] }
        end
      end
    end
  end

end
