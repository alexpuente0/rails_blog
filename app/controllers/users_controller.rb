class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.recent_posts
  end
end
