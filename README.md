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

5. If you want add multiple pincodes just make the changes in `Rakefile`
 - update pincode array
 1. Open Rakefile check PIN_CODES=[416235, 416005] update this value to the value you wanted.
 2. If you want to know the slots for 411001, 411235 and 411216 then it will look like PIN_CODES=[411001, 411216, 411235]

6. Added age_limit checks, you will get alert only when slots are available for your age limit, you want to search vaccine for minimum age 45, thenn got to `Rakefile` find `age_limit` and change the value from 18 to 45, the default is 18, for 18 to 44 filter.

Now you get the SMS notification when the slots are available in specified pin codes for your age limit, SMS contains pin code and available vaccine name.

There are multiple APIs available https://apisetu.gov.in/public/marketplace/api/cowin

##PRs are welcome!!


