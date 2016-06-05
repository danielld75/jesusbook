class PriesthoodsController < ApplicationController

  layout 'user_layout'

  before_action :authenticate_user!

  def new
    @user = current_user
    @priesthood = @user.build_priesthood
  end

  def create
    @user = current_user
    @priesthood = @user.build_priesthood(priesthood_params)
    if @priesthood.save
      redirect_to user_priesthood_path(@user, @priesthood, locale: I18n.locale), notice: "Add Priesthood"
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @priesthood = @user.priesthood
  end

  def update
    @user = current_user
    @priesthood = @user.priesthood
    if @priesthood.update(priesthood_params)
      redirect_to user_priesthood_path(@user, @priesthood, locale: I18n.locale), notice: "Priesthood updated"
    else
      render "edit"
    end
  end

  def show
    @user = current_user
    @priesthood = @user.priesthood
  end

  def destroy
    @priesthood = current_user.priesthood
    @priesthood.destroy
    redirect_to root_path, notice: "Priesthood deleted successfully!"
  end

  private
  def priesthood_params
    params.require(:priesthood).permit(:sacrament_date, :local, :parish, :minister)
  end
end
