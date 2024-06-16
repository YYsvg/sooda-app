class Want < ApplicationRecord
  belongs_to :user

  validates :memo,  presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader
end
