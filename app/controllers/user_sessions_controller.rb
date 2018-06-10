class UserSessionsController < GeneralController
  skip_before_action :require_login, only: %i[new create destroy]
  def new
    render layout: 'before_login'
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
