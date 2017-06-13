class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @user = current_user
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 3).latest_post
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to new_user_post_path, notice: "You are create post"
    else
      @posts = @user.posts
      render 'new'
    end
  end

  def edit
    @user = current_user
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = current_user
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to new_user_post_path, notice: "You updated post"
    else
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @user.posts.find(params[:id]).destroy
    redirect_to new_user_post_path, notice: "You are delete post"
  end

  private
  def post_params
    params.require(:post).permit(:body, :url_youtube, :post_image)
  end
end
