class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  authenticates_with_sorcery!
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  def my_board?(board_user_id)
    id == board_user_id
  end

  def my_follow(board)
    follows.find_by(user_id: id, board_id: board.id)
  end
end
