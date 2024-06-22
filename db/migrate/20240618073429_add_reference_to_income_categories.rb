class AddReferenceToIncomeCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :income_categories, :user, foreign_key: true
  end
end
