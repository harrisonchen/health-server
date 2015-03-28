class TemperatureAggregateDay < ActiveRecord::Base

  before_save :convert_units

  def convert_units
    Temperature._convert_units(self)
  end
end
