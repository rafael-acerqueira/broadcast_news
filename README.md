![ruby](https://img.shields.io/badge/Ruby-2.4.2-red.svg)

# Broadcast News
This project was created as part of a exam. Everyday it will check if there are new courses at eadBox platform and will tweet it.

----
## Setting credentials
Rename `.env.example` to `.env` and fill out the fields with your eadBox and Twitter credentials

## Run App
You can run this app typing `ruby run.rb` on terminal and press enter.

You always can configuring the `schedule.rb` to run `run.rb` file anytime you need. When the configuration is done, run on terminal `whenever --update-crontab` to create a cron. If you want to create a cron in the development environment add the flag `--set environment='development'` after that `whenever --update-crontab`

----
## Test App

run `rspec`
