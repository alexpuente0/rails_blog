class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    values = params.require(:post).permit(:title, :text)
    @post = Post.new(author: current_user, title: values[:title], text: values[:text])

    if @post.save
      redirect_to users_path,
                  notice: 'your post has been published successfully'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    redirect_to root_path
  end
end
