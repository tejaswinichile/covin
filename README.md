# covin
checks covin slots and create beep sound

## Setup
## In 4 simple steps

1. clone the repo
2. go to the folder `cd covin`
3. run `chmod 777 bundle_install.sh`
4. run `./bundle_install.sh`

And you are good to go..

you will get the alert every 1 hour about the available slots.

5. If you wan't add multiple pincodes just make the changes in `Rakefile`
 - update pincode=416235 with your pincode
 - like if you want to knnow the slot available for your area suppose 411001 for next 2-3 days then update 416235 with 411001.
 - It will look like the below
 - response = open("https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=411001&date=#{date}").read

There are multiple APIs available https://apisetu.gov.in/public/marketplace/api/cowin

##PRs are welcome!!


