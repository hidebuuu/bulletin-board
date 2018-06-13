class Board < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
