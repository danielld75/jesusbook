class MarriagesController < ApplicationController

  layout 'user_layout'

	before_action :authenticate_user!

  def new
  	@user = current_user
  	@marriage = @user.build_marriage
  end
  def create
  	@user = current_user
  	@marriage = @user.build_marriage(marriage_params)
  	if @marriage.save
  		redirect_to user_marriage_path(@user, @marriage, locale: I18n.locale), notice: "Add marriage"
  	else
  		render 'new'
  	end
  end

  def edit
    @user = current_user
    @marriage = @user.marriage
  end

  def update
    @user = current_user
    @marriage = @user.marriage
    if @marriage.update(marriage_params)
      redirect_to user_marriage_path(@user, @marriage, locale: I18n.locale), notice: "Marriage updated"
    else
      render "edit"
    end
  end

  def show
    @user = current_user
    @marriage = @user.marriage
  end

  def destroy
    @marriage = current_user.marriage
    @marriage.destroy
    redirect_to root_path, notice: "Marriage deleted successfully!"
  end

  private
  def marriage_params
  	params.require(:marriage).permit(:sacrament_date, :local, :parish, :minister)
  end
end
