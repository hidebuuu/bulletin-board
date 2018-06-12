class DashboardsController < GeneralController
  def index
    @user = User.find_by(params[:id]).decorate
  end
end
