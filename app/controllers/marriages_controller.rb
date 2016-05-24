class MarriagesController < ApplicationController

  layout 'user_layout'

	before_action :authenticate_user!

  def index
  end

  def new
  	@user = current_user
  	@marriage = @user.build_marriage
  end
  def create
  	@user = current_user
  	@marriage = @user.build_marriage(marriage_params)
  	if @marriage.save
  		redirect_to user_marriage_path(@user, @marriage), notice: "Add marriage"
  	else
  		render 'new'
  	end
  end

  def show
  end

  private
  def marriage_params
  	params.require(:marriage).permit(:date, :local, :parish, :minister)
  end
end
