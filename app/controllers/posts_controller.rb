class PostsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.create(params[:post])
    redirect_to :back
  end
  def index
    @posts = Post.all
    @new_post = Post.new
  end
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path
  end
  def show
    @post = Post.find(params[:id])
  end
end
