class UsersController < GeneralController
  skip_before_action :require_login, only: [:new,:create]
  


  def new
      binding.pry
    @user = User.new
    render :layout => 'before_login'
  end

  def create
    @user = User.new(user_params)
    if @user.save
    redirect_to("/login")
    else
      render("/users/new")
  end
end

private

  def user_params
      params.require(:user).permit(:last_name, :first_name , :email ,:password,:password_confirmation)
    end
end
