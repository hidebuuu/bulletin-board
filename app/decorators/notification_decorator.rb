class NotificationDecorator < ApplicationDecorator
  delegate_all

  def notification_image
    if comment?
      notification.target.board.image
    elsif board?
      notification.target.image
    end
  end

  def notification_link
    if comment?
      h.board_path(notification.target.board)
    elsif board?
      h.board_path(notification.target)
    end
  end

  def notification_comment
    if comment?
      'あなたの掲示板にコメントがつきました'
    elsif board?
      '新しい掲示板が作成されました。'
    end
  end

  def title
    if comment?
      'コメント：'
    elsif board?
      'タイトル：'
    end
  end

  def notification_info
    if comment?
      target.content
    elsif board?
      target.title
    end
  end

  def should_notify?
    notification.user != h.current_user
  end
end
