class UsersController < GeneralController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
    render layout: 'before_login'

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation)
  end
end
