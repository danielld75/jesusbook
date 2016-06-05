class WelcomeController < ApplicationController
	layout "user_layout"
  before_action :authenticate_user!, only: :body
  def index

  end
  def body
    @posts = Post.all
  end

end
