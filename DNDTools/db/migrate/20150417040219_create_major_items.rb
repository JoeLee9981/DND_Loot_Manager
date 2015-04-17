class CreateMajorItems < ActiveRecord::Migration
  def change
    create_table :major_items do |t|
      t.string :name
      t.integer :low
      t.integer :high
      t.string :avg_val

      t.timestamps
    end
  end
end
