class OutcomeCategory < ApplicationRecord
  has_many :outcomes, dependent: :destroy

  validates :name,    presence: true
end
