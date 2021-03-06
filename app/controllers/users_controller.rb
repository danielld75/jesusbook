class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def create
    pry
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = current_user
    @baptism = @user.baptism
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "#{@user.email} has been delete"
  end

  private
  def user_params
    require.params(:user).permit(:name, :lastName, :email, :country, :baptism_date_user, :password, :password_confirmation)
  end
end
