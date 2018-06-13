class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :danger
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
