class OutcomeCategory < ApplicationRecord
  belongs_to :user
  has_many :outcomes, dependent: :destroy
  
  validates :name,    presence: true
end
