class AddReferenceToOutcomes < ActiveRecord::Migration[5.2]
  def change
    add_reference :outcomes, :outcome_category, foreign_key: true
    add_reference :outcomes, :user, foreign_key: true
  end
end
