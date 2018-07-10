class Admin::DashboardsController < AdminController
  before_action :admin_permit

  def index; end

  private

  def admin_permit
    redirect_to not_admin_path if current_user.standard_user?
  end
end
