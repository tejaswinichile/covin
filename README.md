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
 - update pincode array
 1. Open Rakefile check PIN_CODES=[416235, 416005] update this value to the value you wanted.
 2. If you want to know the slots for 411001, 411235 and 411216 then it will look like PIN_CODES=[411001, 411216, 411235]

There are multiple APIs available https://apisetu.gov.in/public/marketplace/api/cowin

##PRs are welcome!!


