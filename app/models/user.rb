class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :boards
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
