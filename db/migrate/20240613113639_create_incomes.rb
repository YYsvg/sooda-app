class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :memo,        null: false
      t.integer :price,      null: false

      t.string :image
      t.timestamps
    end
  end
end
