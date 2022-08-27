class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = @user.recent_posts
  end

  def api_token
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user.api_token, status: :ok }
      format.html
    end
  end
end
