class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :danger
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: :not_found, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: :internal_server_error, layout: 'application', content_type: 'text/html'
  end
end
