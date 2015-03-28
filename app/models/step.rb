class Step < ActiveRecord::Base
  def self.aggregate_daily_steps
    aggregate_steps(1.day.ago, StepAggregateDay)
  end

  def self.aggregate_weekly_steps
    aggregate_steps(7.day.ago, StepAggregateWeek)
  end

  private

    def self.aggregate_steps(period, model)
      recent = Step.where('created_at > ?', period)

      if recent.count == 0
        return
      end

      aggregate = average_steps(recent)

      model.create(count: aggregate)
    end

    def self.average_steps(steps)
      avg_steps = 0

      steps.each do |step|
        avg_steps += step.count
      end

      avg_steps /= steps.count
    end
end
