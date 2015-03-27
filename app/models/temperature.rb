class Temperature < ActiveRecord::Base
	validates :fahrenheit, presence: true

	before_save :convert_units

	def convert_units
  	self.celsius = (fahrenheit - 32) * (5.0/9.0)
  	self.kelvin = celsius + 273
  end

  def self.aggregate_daily_tempuratures
    aggregate_temperatures(10, TemperatureAggregateDay)
  end

  def self.aggregate_weekly_tempuratures
    aggregate_temperatures(20, TemperatureAggregateWeek)
  end

  private

    def self.aggregate_temperatures(period, model)
      last_10_temperatures = Temperature.all.order("id desc").limit(period)

      if last_10_temperatures.count == 0
        return
      end

      daily_temperature = average_temperature(last_10_temperatures)

      model.create(fahrenheit: daily_temperature)
    end

    def self.average_temperature(temperatures)
      avg_temperature = 0

      temperatures.each do |temperature|
        avg_temperature += temperature.fahrenheit
      end

      avg_temperature /= temperatures.count
    end

    def self.delete_temperatures(temperatures)
      temperatures.each do |temperature|
        temperature.destroy
      end
    end
end
