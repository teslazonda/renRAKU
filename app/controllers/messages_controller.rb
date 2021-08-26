class MessagesController < ApplicationController
  def create
  end

  def new
  end

  def index
    # @user = current_user
    @messages = policy_scope(Message)
    @student = Student.find(params[:student_id])
  end
end
