class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :content, presence: true
  validates :user_id, presence: true
  validates :board_id, presence: true
end
