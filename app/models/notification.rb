class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :board_search, ->(user_id) { where(target_type: 'Board').where.not(user_id: user_id) }
  scope :comment_search, -> (user_id) { where(target_type: 'Comment').where.not(user_id: user_id) }
  scope :created_after, ->(time) { where('created_at > ?', time) }

  def comment?
    target.is_a?(Comment)
  end

  def board?
    target.is_a?(Board)
  end
  def self.notifications_by_condition(condition, user_id)
    case condition
    when 'board'
      Notification.board_search(user_id)
    when 'comment'
      Notification.comment_search(user_id)
    else
      notifications = Notification.comment_search(user_id) + Notification.board_search(user_id)
      Notification.where(id: notifications.map {|n| n.id } )
    end
  end
end
