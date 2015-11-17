class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_path(user)
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| u.permit(:name, :email, :password, :password_confirmation, :aboutMe, :name, :lastName, :birthday, :religion) end
    devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:name, :email, :password, :password_confirmation, :aboutMe, :name, :lastName, :birthday, :religion) end
  end


end
