class UserSessionsController < GeneralController
  skip_before_action :require_login, only: %i[new create destroy]

  def new
    render layout: 'before_login'
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      flash[:success] = "ログインしました！"
      redirect_to root_path 
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    logout
    flash.now[:info] = "ログアウトしました。"
    render :new
  end
end
