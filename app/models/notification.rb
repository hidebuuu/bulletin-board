class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true
  scope :board_search, ->(user_id) { where(target_type: 'Board').where.not(user_id: user_id) }
  scope :comment_search, -> { where(target_type: 'Comment') }
  scope :comment_board_search, ->(board_ids) { where(target_id: Comment.where(board_id: board_ids).pluck(:id)) }
  scope :created_after, ->(time) { where('created_at > ?', time) }

  def comment?
    target.is_a?(Comment)
  end

  def board?
    target.is_a?(Board)
  end

  def self.notifications_by_condition(condition, user_id, board_ids)
    case condition
    when 'board'
      Notification.board_search(user_id)
    when 'comment'
      Notification.comment_search.comment_board_search(board_ids)
    else
      notifications = Notification.comment_search.comment_board_search(board_ids) + Notification.board_search(user_id)
      Notification.where(id: notifications.map(&:id))
    end
  end
end
