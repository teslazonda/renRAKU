class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_kurasu, only: %i[create new index]
  add_breadcrumb "Dashboard", :dashboards_path
  add_breadcrumb "Classes", :kurasus_path
  add_breadcrumb "Meetings", :kurasu_meetings_path

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
    @meeting.kurasu = Kurasu.find(params[:kurasu_id])
    authorize @meeting
    if @meeting.save
      redirect_to meeting_path
    else
      render '/meetings/new'
      raise
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
    @meeting.parent = current_user
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
