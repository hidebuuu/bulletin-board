module ApplicationHelper

  def notification_select_options
    [
      %w[全て表示 all],
      %w[掲示板作成情報のみ表示 board],
      %w[コメント情報のみ表示 comment]
    ]
  end
end
