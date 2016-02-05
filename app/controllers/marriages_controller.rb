class MarriagesController < ApplicationController

	before_action :authenticate_user!

  def index
  end

  def new
  	@user = current_user
  	@marriage = Marriage.new
  end
  def create
  	@user = current_user
  	@marriage = @user.buiild_marriage(marriage_params)
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
