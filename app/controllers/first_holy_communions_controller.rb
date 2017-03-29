class FirstHolyCommunionsController < ApplicationController
  layout 'user_layout'
  before_action :authenticate_user!

  def new
    @user = current_user
    @first_holy_communion = @user.build_first_holy_communion
  end

  def create
    @user = current_user
    @first_holy_communion = @user.build_first_holy_communion(first_holy_communion_params)
    if @first_holy_communion.save
      redirect_to user_first_holy_communion_path(@user, @first_holy_communion, locale: I18n.locale), notice: "The First Holy Communion was created successfully!"
    else
      redner 'new'
    end
  end

  def edit
    @user = current_user
    @first_holy_communion = @user.first_holy_communion
  end

  def show
    @user = current_user
    @first_holy_communion = @user.first_holy_communion
  end

  def destroy
    @first_holy_communion = current_user.first_holy_communion
    @first_holy_communion.destroy
    redirect_to root_path, notice: "First Holy Communion was destroyed"
  end

  def update
    @user = current_user
    @first_holy_communion = @user.first_holy_communion
    if @first_holy_communion.update(first_holy_communion_params)
      redirect_to user_first_holy_communion_path(@user, @first_holy_communion, locale: I18n.locale), notice: "First Holy Communion updated"
    else
      render "edit"
    end
  end

  private
  def first_holy_communion_params
    params.require(:first_holy_communion).permit(:sacrament_date, :local, :parish, :minister)
  end
end
