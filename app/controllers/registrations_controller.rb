class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_in_path_for(user)
    society_path
  end

  def after_update_path_for(user)
    user_path(user)
  end

end
