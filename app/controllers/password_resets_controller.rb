class PasswordResetsController < GeneralController
  skip_before_action :require_login
  layout 'before_login'

  def create
    @user = User.find_by(email: params[:email])
    @user.deliver_reset_password_instructions!
    redirect_to root_path, success: 'パスワード再発行のメールを送信しました。'
  end

  def edit
    set_token_user_from_params?
  end

  def update
    return if !set_token_user_from_params?
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      redirect_to login_path, success: 'パスワードの更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def set_token_user_from_params?
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    if @user.blank?
      not_authenticated
      return false
    else
      return true
    end
  end
end
