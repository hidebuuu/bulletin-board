class UserSessionsController < GeneralController
  skip_before_action :require_login, only: %i[new create destroy]
  layout 'before_login'

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to root_path, success: t('.success')
    else
      redirect_to login_path, danger: t('.danger')
    end
  end

  def destroy
    logout
    redirect_to login_path, info: t('.info')
  end
end
