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
      redirect_to users_path, notice: "Baptism created"
    else
      render 'new'
    end
  end

  def index
    @baptisms = Baptism.all
  end

  def show
  end

  def edit
  end

  private
  def baptism_params
    params.require(:baptism).permit(:local, :date, :parish, :minister)
  end

end
