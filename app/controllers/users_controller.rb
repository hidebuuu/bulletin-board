class UsersController < GeneralController
  skip_before_action :require_login, only: %i[new create]
  layout "before_login"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "会員登録が完了しました。"
    else
      flash.now[:danger] = "もう一度入力してください。"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
