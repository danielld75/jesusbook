class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to @user
    else
      render 'index'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'index'
    end
  end

  private
  def user_params
    require.params(:user).permit(:name, :lastName, :aboutMe, :birthday, :religion, :created_at)
  end
end
