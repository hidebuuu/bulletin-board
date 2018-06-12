class UserSessionsController < GeneralController
  skip_before_action :require_login, only: %i[new create destroy]
  layout 'before_login'

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to root_path, success: 'ログインしました'
    else
      redirect_to login_path, danger: 'ログインに失敗しました。'
    end
  end

  def destroy
    logout
    redirect_to login_path, info: 'ログアウトしました。'
  end
end
