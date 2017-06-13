class ProfilesController < ApplicationController

  before_action :authenticate_user!

  def show
    @person = User.find(params[:id])
  end
end
