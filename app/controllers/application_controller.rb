class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'youtube_embed'

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def search
    @q = User.ransack(params[:q])
    @people = @q.result.paginate(page: params[:page], per_page: 10)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
     { :locale => I18n.locale }.merge options
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :place, :remember_me, :name, :lastName, :avatar, :baptism_date_user])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :place, :current_password, :name, :lastName, :avatar])
  end
end
