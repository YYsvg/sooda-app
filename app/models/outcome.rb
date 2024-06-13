class Outcome < ApplicationRecord
  belongs_to :outcome_category
  belongs_to :user

  validates :memo,  presence: true
  validates :price, presence: true
end
