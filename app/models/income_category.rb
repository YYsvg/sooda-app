class IncomeCategory < ApplicationRecord
  has_many :incomes, dependent: :destroy
  belongs_to :user
  validates :name,    presence: true
end
