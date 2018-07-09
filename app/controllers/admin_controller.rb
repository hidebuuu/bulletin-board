class AdminController < ApplicationController
  layout 'admin_application'

  def notadminuser
    render layout: 'admin_before_login'
  end
end
