class DashboardsController < GeneralController
  def index
    @notifications = Notification.notifications_by_condition(params[:condition])
    @notifications = @notifications.created_after(current_user.last_logout_at).decorate
  end
end
