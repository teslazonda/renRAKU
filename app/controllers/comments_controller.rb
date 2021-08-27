class CommentsController < ApplicationController
  def create
    authorize @comment
  end

  def new
    @message = Message.find(params[:message_id])
    @comment = Comment.new
    authorize @comment
  end
end
