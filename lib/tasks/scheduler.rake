namespace :scheduler do
  desc "TODO"
  task aggregate_daily_temperatures: :environment do
    Temperature.aggregate_daily_temperatures
  end

  task aggregate_weekly_temperatures: :environment do
    Temperature.aggregate_weekly_temperatures
  end

  task aggregate_daily_heartbeats: :environment do
    Heartbeat.aggregate_daily_heartbeats
  end

  task aggregate_weekly_heartbeats: :environment do
    Heartbeat.aggregate_weekly_heartbeats
  end

  task aggregate_daily_steps: :environment do
    Step.aggregate_daily_steps
  end

  task aggregate_weekly_steps: :environment do
    Step.aggregate_weekly_steps
  end
end
