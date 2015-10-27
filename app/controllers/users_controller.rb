class UsersController < ApplicationController
  force_ssl

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
