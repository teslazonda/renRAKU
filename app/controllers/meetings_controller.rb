class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_kurasu, only: %i[create new index]
  before_action :create_user, only: %i[index create]
  before_action :display_meetings, only: %i[index create]
  add_breadcrumb "Dashboard", :dashboards_path
  add_breadcrumb "Classes", :kurasus_path
  add_breadcrumb "Meetings", :kurasu_meetings_path

  def index
  end

  def show
  end

  def create
    @new_meetings = []
    meeting_creation
    @new_meetings.each do |meeting|
      unless meeting.save
        render 'meetings/index'
        return nil
      end
    end
    redirect_to kurasu_meetings_path
  end

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def edit
    @meeting = Meeting.find(params[:meeting_id])
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

  def meeting_creation
    hour_counter = 0
    5.times do
      @meeting = Meeting.new(meeting_params)
      @meeting.teacher = current_user
      @meeting.kurasu = Kurasu.find(params[:kurasu_id])
      @meeting.hour = hour_counter
      hour_counter += 1
      authorize @meeting
      @new_meetings << @meeting
    end
  end

  def meeting_params
    params.require(:meeting).permit(:title, :content, :date, :parent_id)
  end

  def find_meeting
    Meeting.find(params[:id])
  end

  def display_meetings
    if @user.teacher
      @meetings = policy_scope(current_user.meetings_as_teacher).order(:date).order(:hour)
      @meeting = Meeting.new
    elsif !current_user.meetings_as_parent.empty?
      @meetings = policy_scope(current_user.meetings_as_parent).order(:date).order(:hour)
    else
      @meetings = policy_scope(Meeting).where(parent_id: nil).order(:date).order(:hour)
    end
  end

  def create_user
    @user = current_user
  end
end
