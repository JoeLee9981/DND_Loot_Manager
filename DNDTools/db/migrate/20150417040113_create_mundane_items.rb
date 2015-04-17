class CreateMundaneItems < ActiveRecord::Migration
  def change
    create_table :mundane_items do |t|
      t.string :name
      t.integer :low
      t.integer :high
      t.integer :sub_low
      t.integer :sub_high
      t.string :avg_val

      t.timestamps
    end
  end
end
