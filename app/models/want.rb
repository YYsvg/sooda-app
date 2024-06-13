class Want < ApplicationRecord
  belongs_to :user

  validates :memo,  presence: true
  validates :price, presence: true
end
