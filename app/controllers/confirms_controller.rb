class ConfirmsController < ApplicationController
  before_action :authenticate_user!

  def index
    @confirms = Confirm.all
  end

  def new
    @user = current_user
    @confirm = @user.build_confirm
  end

  def create
    @user = current_user
    @confirm = @user.build_confirm(confirm_params)
    if @confirm.save
      redirect_to user_confirm_path(@user, @confirm), notice: "The confirmation was created successfully!"
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @confirm = @user.confirm
  end

  def destroy
    @confirm = current_user.confirm
    @confirm.destroy
    redirect_to root_path, notice: "Confirmation was destroyed"
  end

  def show
    @user = current_user
    @confirm = @user.confirm
    if @confirm.update(confirm_params)
      redirect_to user_confirm_path(@user, @confirm), notice: "Confirmation updated!"
    else
      render "edit"
    end
  end

  def update
    @user = current_user
    @confirm = @user.confirm
  end

  private
  def confirm_params
    params.require(:confim).permit(:date, :local, :parish, :minister)
  end
end
