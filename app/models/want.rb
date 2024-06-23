class Want < ApplicationRecord
  belongs_to :user

  validates :memo,  length: { maximum: 50 },presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader
end
