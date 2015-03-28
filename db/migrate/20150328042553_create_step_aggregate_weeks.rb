class CreateStepAggregateWeeks < ActiveRecord::Migration
  def change
    create_table :step_aggregate_weeks do |t|
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
