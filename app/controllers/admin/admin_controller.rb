class Admin::AdminController < ApplicationController
  layout 'admin_application'

  def notadminuser
    render layout: 'not_admin_user'
  end
end
