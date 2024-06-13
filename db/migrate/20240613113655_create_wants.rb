class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.string :memo,        null: false
      t.integer :price,      null: false, default: 0

      t.string :image

      t.timestamps
    end
  end
end
