class UserDecorator < ApplicationDecorator
  delegate_all

  def user_image
    "#{image}"
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
