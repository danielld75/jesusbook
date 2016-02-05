class ConfirmationsController < ApplicationController
  before_action :authenticate_user!

  def new
    render plain: "hello"
  end

  def edit

  end

  def destroy
  end

  def show
    render plain: "text"
  end

  def update
  end
end
