class BaptismsController < ApplicationController

  before_action :authenticate_user!
  # before_action :current_user

  def new
    @user = current_user
    @baptism = @user.build_baptism
  end

  def create
    @user = current_user
    @baptism = @user.build_baptism(baptism_params)
    if @baptism.save
      redirect_to user_baptism_path(@user, @baptism), notice: "Baptism created"
    else
      render 'new'
    end
  end

  def index
    @baptisms = Baptism.all
  end

  def show
    @user = current_user
    @baptism = @user.baptism
  end

  def edit
    @user = current_user
    @baptism = @user.baptism
  end

  def update
    @user = current_user
    @baptism = @user.baptism
    if @baptism.update(baptism_params)
      redirect_to user_baptism_path(@user, @baptism), notice: "Baptism updated"
    else
      render "edit"
    end
  end

  def destroy
    @baptism = current_user.baptism
    @baptism.destroy
    redirect_to root_path, notice: "Baptism deleted successfully!"
  end

  private
  def baptism_params
    params.require(:baptism).permit(:local, :date, :parish, :minister)
  end

end
