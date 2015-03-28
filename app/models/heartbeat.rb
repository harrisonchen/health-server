class Heartbeat < ActiveRecord::Base
  def self.aggregate_daily_heartbeats
    aggregate_heartbeats(1.day.ago, HeartbeatAggregateDay)
  end

  def self.aggregate_weekly_heartbeats
    aggregate_heartbeats(7.day.ago, HeartbeatAggregateWeek)
  end

  private

    def self.aggregate_heartbeats(period, model)
      recent = Heartbeat.where('created_at > ?', period)

      if recent.count == 0
        return
      end

      aggregate = average_heartbeats(recent)

      model.create(beats_per_minute: aggregate)
    end

    def self.average_heartbeats(heartbeats)
      avg_heartbeats = 0

      heartbeats.each do |heartbeat|
        avg_heartbeats += heartbeat.beats_per_minute
      end

      avg_heartbeats /= heartbeats.count
    end
end
