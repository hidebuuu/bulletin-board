class Admin::UsersController < AdminController
  before_action :set_user, only: %i[show destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def show; end

  def destroy
    @user.destroy
    redirect_to admin_users_path, success: 'ユーザーの削除が完了しました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
