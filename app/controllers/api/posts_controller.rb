class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = @post.author
  end
end
