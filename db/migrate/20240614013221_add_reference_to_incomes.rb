class AddReferenceToIncomes < ActiveRecord::Migration[5.2]
  def change
    add_reference :incomes, :income_category, foreign_key: true
    add_reference :incomes, :user, foreign_key: true
  end
end
