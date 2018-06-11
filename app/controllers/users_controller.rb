class UsersController < GeneralController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
    render layout: 'before_login'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = '会員登録が完了しました！'
      render 'user_sessions/new'
    else
      flash.now[:danger] = 'もう一度入力してください。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
