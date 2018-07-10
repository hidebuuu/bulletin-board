class Admin::UserSessionsController < AdminController

  def new
    render layout: 'admin_before_login'
  end

  def create
    @user = login(params[:email], params[:password])

    if @user.admin_user?
      redirect_to admin_dashboards_path
    else
      redirect_to not_admin_path
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: "ログアウトしました。"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
