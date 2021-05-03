#!/bin/bash

rbenv install 2.7.0
rbenv local 2.7.0
bundle install
bundle exec whenever
whenever --update-crontab

echo "Completed"
