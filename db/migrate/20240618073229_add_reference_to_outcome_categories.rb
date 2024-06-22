class AddReferenceToOutcomeCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :outcome_categories, :user, foreign_key: true
  end
end
