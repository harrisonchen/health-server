class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
