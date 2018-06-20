class Board < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :follows, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
