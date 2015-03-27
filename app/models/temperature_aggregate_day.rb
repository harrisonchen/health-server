class TemperatureAggregateDay < ActiveRecord::Base

  before_save :convert_units

  def convert_units
    Temperature.convert_units(self, fahrenheit)
  end
end
