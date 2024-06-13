class IncomeCategory < ApplicationRecord
  has_many :incomes, dependent: :destroy

  validates :name,    presence: true
end
