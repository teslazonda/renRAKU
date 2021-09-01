class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_kurasu, only: %i[create new index]

  def index
    @user = current_user
    @meetings = Meeting.where(current_user == :user)
    @meetings = policy_scope(Meeting)
    @meeting = Meeting.new
  end

  def show
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.teacher = current_user
    @meeting.parent = @kurasu.parents
    authorize @meeting
    if @meeting.save
      redirect_to meetings_path
    else
      render '/meetings/new'
    end
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def edit
    authorize @meeting
  end

  def update
    authorize @meeting
  end

  private

  def find_kurasu
    @kurasu = Kurasu.find(params[:kurasu_id])
  end

  def meeting_params
    params.require(:meeting).permit(:title, :content, :date, :parent_id)
  end

  def find_meeting
    Meeting.find(params[:id]) # TODO: change this later
  end
end
