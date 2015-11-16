class UsersController < ApplicationController


  # before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'index'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "#{@user.email} has been delete"
  end

  private
  def user_params
    require.params(:user).permit(:name, :lastName, :aboutMe, :birthday, :religion)
  end
end
