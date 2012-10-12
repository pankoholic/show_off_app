class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
  def new
    @comment = Comment.new
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @post
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
