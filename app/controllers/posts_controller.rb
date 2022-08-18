class PostsController < ApplicationController
  def index
    @user = User.where(id: params[:user_id]).first
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
     @user = User.where(id: params[:user_id]).first
  end
end
