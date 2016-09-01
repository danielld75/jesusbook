class ProfilesController < ApplicationController

  layout "user_layout"
  before_action :authenticate_user!

  def show
    @person = User.find(params[:id])
  end
end
