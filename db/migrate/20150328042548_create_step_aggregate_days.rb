class CreateStepAggregateDays < ActiveRecord::Migration
  def change
    create_table :step_aggregate_days do |t|
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
