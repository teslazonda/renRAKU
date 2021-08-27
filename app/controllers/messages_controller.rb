class MessagesController < ApplicationController
  before_action :find_student, only: %i[index create new]
  def index
    # @user = current_user
    @user = current_user
    @messages = policy_scope(Message)
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.student = @student
    authorize @message
    if @message.save
      redirect_to student_messages_path(@student)
    else
      render '/messages/new'
    end
  end

  def new
    @message = Message.new
    authorize @message
  end

  private

  def find_student
    @student = Student.find(params[:student_id])
  end

  def message_params
    params.require(:message).permit(:title, :content, :photo, :student_id, :user_id)
  end
end
