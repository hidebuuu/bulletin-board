class NotificationDecorator < ApplicationDecorator
  delegate_all

  def notification_image
    comment? ?  notification.target.board.image : notification.target.image
  end

  def notification_link
    comment? ? h.board_path(notification.target.board) : h.board_path(notification.target)
  end

  def notification_comment
    comment? ? 'あなたの掲示板にコメントがつきました' : '新しい掲示板が作成されました。'
  end

  def title
    comment? ? 'コメント：' : 'タイトル：'
  end

  def notification_info
    comment? ? target.content : target.title
  end
end
