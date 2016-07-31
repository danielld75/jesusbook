class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(user)
    society_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
     { :locale => I18n.locale }.merge options
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :aboutMe, :name, :lastName, :birthday, :religion, :avatar) end
    devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :aboutMe, :name, :lastName, :birthday, :religion, :avatar) end
  end
end
