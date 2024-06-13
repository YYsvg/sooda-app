class Income < ApplicationRecord
  belongs_to :income_category
  belongs_to :user

  validates :memo,  presence: true
  validates :price, presence: true
end
