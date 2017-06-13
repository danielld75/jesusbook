class ConfirmSacramentsController < ApplicationController


  before_action :authenticate_user!

  def index
    @confirms = ConfirmSacrament.all
  end

  def new
    @user = current_user
    @confirm_sacrament = @user.build_confirm_sacrament
  end

  def create
    @user = current_user
    @confirm_sacrament = @user.build_confirm_sacrament(confirm_sacrament_params)
    if @confirm_sacrament.save
      redirect_to user_confirm_sacrament_path(@user, @confirm_sacrament, locale: I18n.locale), notice: t('.notice')
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @confirm_sacrament = @user.confirm_sacrament
  end

  def destroy
    @confirm_sacrament = current_user.confirm_sacrament
    @confirm_sacrament.destroy
    redirect_to root_path, notice: t('.notice')
  end

  def show
    @user = current_user
    @confirm_sacrament = @user.confirm_sacrament
  end

  def update
    @user = current_user
    @confirm_sacrament = @user.confirm_sacrament
    if @confirm_sacrament.update(confirm_sacrament_params)
      redirect_to user_confirm_sacrament_path(@user, @confirm_sacrament, locale: I18n.locale), notice: t('.notice')
    else
      render "edit"
    end
  end

  private
  def confirm_sacrament_params
    params.require(:confirm_sacrament).permit(:sacrament_date, :local, :parish, :minister)
  end
end
