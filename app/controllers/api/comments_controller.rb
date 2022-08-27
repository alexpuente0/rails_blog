class Api::CommentsController < ApplicationController
  def create
    values = params.require(:comment).permit(:text)
    comment = Comment.new(text: values[:text], author_id: current_user.id, post_id: params[:post_id])

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end
end
