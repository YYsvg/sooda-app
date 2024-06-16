class Outcome < ApplicationRecord
  belongs_to :outcome_category
  belongs_to :user

  validates :memo,  presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader

  def start_time
    created_at
  end
end
