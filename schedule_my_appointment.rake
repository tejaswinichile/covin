namespace :covin do

  desc 'Send alerts for all available appointments'
  task :check_available_slots  do
    response = open('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=416235&date=05-05-2021').read
    response = JSON.parse(response) # {sessions: []}
    response.sessions.any?
  end
end
