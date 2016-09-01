class WelcomeController < ApplicationController

	layout "user_layout"
  before_action :authenticate_user!, only: [:body, :search]

  def index
  end

  def body
    @posts = Post.paginate(:page => params[:page], per_page: 7).latest_post
  end

end
