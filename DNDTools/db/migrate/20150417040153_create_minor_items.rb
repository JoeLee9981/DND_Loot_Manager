class CreateMinorItems < ActiveRecord::Migration
  def change
    create_table :minor_items do |t|
      t.string :name
      t.integer :low
      t.integer :high
      t.string :avg_val

      t.timestamps
    end
  end
end
