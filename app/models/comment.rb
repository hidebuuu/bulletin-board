class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :notifications, inverse_of: :target, as: :target, dependent: :destroy
  validates :content, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true
end
