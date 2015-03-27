class CreateTemperatureAggregateWeeks < ActiveRecord::Migration
  def change
    create_table :temperature_aggregate_weeks do |t|
      t.decimal :fahrenheit
      t.decimal :celsius
      t.decimal :kelvin

      t.timestamps
    end
  end
end
