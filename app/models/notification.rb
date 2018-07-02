class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true

  scope :board, -> { where(target_type: 'Board') }
  scope :comment, -> { where(target_type: 'Comment') }
  scope :created_after, ->(time) { where('created_at > ?', time) }

  def comment?
    target.is_a?(Comment)
  end

  def board?
    target.is_a?(Board)
  end

  def self.notifications_by_condition(condition)
    case condition
    when 'board'
      Notification.board
    when 'comment'
      Notification.comment
    else
      Notification.all
    end
  end
end
