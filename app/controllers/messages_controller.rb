class MessagesController < ApplicationController
  before_action :find_student, only: %i[create new]
  add_breadcrumb "Dashboard", :dashboards_path
  add_breadcrumb "Classes", :kurasus_path
  add_breadcrumb "Messages", :student_messages_path
  def index
    @message = Message.new
    @comment = Comment.new
    # authorize @message
    # Since teachers have to be brought to the class list to choose a student before getting to the messages index
    # and parents are brought directly to their children's message indexes, we find the student by different means.
    if current_user.teacher
      @student = Student.find(params[:student_id])
    else
      @student = Student.find_by(user: current_user)
    end
    @user = current_user
    @messages = policy_scope(Message).where(student: @student)
  end

  # Create route
  # Ceate non-CRUD action to change status of comment from unread to read

  def read
    @message = Message.find(params[:id])
    authorize @message
    @message.comments.each do |comment|
      comment.status = "read"
      comment.save
    end
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.student = @student
    authorize @message
    if @message.save
      redirect_to student_messages_path(@student)
      LineCreator.new("New message in notebook").send_line
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
    params.require(:message).permit(:title, :content, :photo, :student_id, :user_id, :message_id)
  end
end
