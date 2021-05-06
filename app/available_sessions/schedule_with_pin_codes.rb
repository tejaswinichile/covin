class ScheduleWithPinCodes
  # 416235 416005 416119 416216 416103 416207 416211
  PIN_CODES = %w[416213 416005 416007 416120 416115 416003 416002 416005].freeze

  def process
    system("say check in progress for the pin codes")

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
      date = (Date.today + 4).strftime('%d-%m-%Y')
      slot_available?(pin: pin_code, date: date)
    end
  end

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
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=#{pin}&date=#{date}",
    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51"
    ).read
    sessions = JSON.parse(response)
    available_sessions = sessions['sessions']

    puts date
    puts sessions.to_s

    if available_sessions.any?
      available_sessions.each do |session|
        if session['min_age_limit'] == age_limit
          system("say slot available at #{pin}")
          available_slots << { pin: pin, vaccine_name: session['vaccine'] }
        end
      end
    end

    if available_slots.any?
      sms_alert_config
      @client.sms.send(
        from: "Vonage APIs",
        to: "918485827731",
        text: "slot available at #{available_slots.join(',')}"
      )
    end
  end

end
