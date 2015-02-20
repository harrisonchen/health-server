class AggregateData
	def self.extract_daily_temperature
		last_10_temperatures = Temperature.all.order("id desc").limit(10)

		if last_10_temperatures.count == 0
			return
		end

		daily_temperature = average_temperature(last_10_temperatures)

		TemperatureAggregateDay.create(fahrenheit: daily_temperature)

		delete_temperatures(last_10_temperatures)
	end

	private

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