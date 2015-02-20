require "rails_helper"
require "aggregate_data.rb"

RSpec.describe "AggregateData" do

	before(:each) do
		@avg_temperature = 0

  	range = 1..10
  	range.each do |i|
  		f = i.to_f
  		Temperature.create(fahrenheit: f)
  		@avg_temperature += f
  	end

  	@avg_temperature /= range.count
	end

	it "should add a new daily temperature to TemperatureAggregateDay" do
  	AggregateData.extract_daily_temperature

  	expect(TemperatureAggregateDay.last.fahrenheit).to eq(@avg_temperature)
  end

  it "should remove last 10 temperatures from Temperatures" do

  	expect{AggregateData.extract_daily_temperature}
  		.to change{Temperature.all.count}
		  		.from(Temperature.all.count)
		  		.to(Temperature.all.count - 10)
	end
end