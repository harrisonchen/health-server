# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron_log.log"

job_type :runner,  "cd :path && rvm ruby-2.2.0 && bin/rails runner ':task' :output"

every 1.minute do
  runner "Temperature.aggregate_daily_temperatures"
end

# Learn more: http://github.com/javan/whenever
