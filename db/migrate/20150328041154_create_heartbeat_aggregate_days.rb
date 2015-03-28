class CreateHeartbeatAggregateDays < ActiveRecord::Migration
  def change
    create_table :heartbeat_aggregate_days do |t|
      t.integer :beats_per_second, default: 0
      t.integer :beats_per_minute, default: 0

      t.timestamps
    end
  end
end
