class MessagesController < ApplicationController
  def create
    authorize @message
  end

  def new
    authorize @message
  end

  def index
    # @user = current_user
    @user = current_user
    @messages = policy_scope(Message)
    @student = Student.find(params[:student_id])
  end
end
