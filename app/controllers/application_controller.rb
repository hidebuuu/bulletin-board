class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :danger
  protect_from_forgery with: :exception
end
