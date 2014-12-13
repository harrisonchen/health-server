class CreateHealths < ActiveRecord::Migration
  def change
    create_table :healths do |t|
      t.string :status, default: ""

      t.timestamps
    end
  end
end
