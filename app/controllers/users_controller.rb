class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.recent_posts
  end
end
