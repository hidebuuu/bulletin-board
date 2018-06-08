class UserSessionsController < GeneralController
  skip_before_action :require_login, only: [:new,:create,:destroy]


  def new
    render :layout => 'before_login'
  end

  def create
    @user = login(params[:email], params[:password])
    if @user.present?
      redirect_to("/")
    else
      redirect_to("/login")
    end
  end

  def destroy
    logout
    redirect_to("/login")
  end
end
