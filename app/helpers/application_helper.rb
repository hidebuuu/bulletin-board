module ApplicationHelper

  def notification_select_options
    [
      %w[全て表示 all],
      %w[掲示板作成情報のみ表示 board],
      %w[コメント情報のみ表示 comment]
    ]
  end

  def error_messages(instance)
    return if not instance.errors.any?
    content_tag :div, class: 'container' do
      content_tag :div, class: 'alert alert-danger alert-dismissable' do
        concat button_tag 'x', class: 'close', data: { dismiss: 'alert' }, aria: { hidden: 'true' }
        instance.errors.full_messages.each do |msg|
          concat content_tag :li, msg
        end
      end
    end
  end
end
