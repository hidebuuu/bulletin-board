class DashboardsController < GeneralController
  def index
    board_ids = Board.where(user_id: current_user.id).pluck(:id)
    notifications = Notification.notifications_by_condition(params[:condition], current_user.id, board_ids)
    @notifications = notifications.created_after(current_user.last_logout_at).decorate
  end
end
