class CommentsController < ApplicationController
  before_action :find_message, only: %i[create new]
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.message = @message
    authorize @comment
    if @comment.save
      redirect_to student_messages_path(@message.student_id)
      LineCreator.new("New comment in notebook").send_line
    else
      render 'comments/new'
    end
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  private

  def find_message
    @message = Message.find(params[:message_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
