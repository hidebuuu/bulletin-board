class Follow < ApplicationRecord
  validates :user_id, presence: true
  validates :board_id, presence: true
  belongs_to :user
  belongs_to :board

  def whether_follow_index
    if params[:controller] == "follows" && params[:action] == "index"
    end
  end
end
