class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  authenticates_with_sorcery!
  has_many :notifications, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy
  validates :email, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :first_name, presence: true
  validates :last_name, presence: true

  enum user_type: {
  standard_user: 0,
  admin_user: 1
}

  def my_board?(board_user_id)
    id == board_user_id
  end

  def my_follow(board)
    follows.find_by(user_id: id, board_id: board.id)
  end
end
