class DashboardsController < GeneralController
  def index
    @user = User.find_by(id: session[:user_id]).decorate
  end
end
