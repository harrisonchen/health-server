namespace :scheduler do
  desc "TODO"
  task aggregate_daily_temperatures: :environment do
    Temperature.aggregate_daily_temperatures
  end
end
