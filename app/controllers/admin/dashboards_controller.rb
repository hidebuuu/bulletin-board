class Admin::DashboardsController < AdminController
  before_action :admin_permit

  def index
  end

  private

  def admin_permit
    if current_user.standard_user?
    redirect_to not_admin_path
    end
  end
end
