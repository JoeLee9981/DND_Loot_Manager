class CreateLootRolls < ActiveRecord::Migration
  def change
    create_table :loot_rolls do |t|
      t.integer :level
      t.string :loot_type
      t.integer :low_roll
      t.integer :high_roll
      t.string :die
      t.integer :scale
      t.string :coin_type
      t.string :sub_type

      t.timestamps
    end
  end
end
