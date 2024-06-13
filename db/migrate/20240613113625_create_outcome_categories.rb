class CreateOutcomeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :outcome_categories do |t|
      t.string :name, null: false
      t.string :image
      
      t.timestamps
    end
  end
end
