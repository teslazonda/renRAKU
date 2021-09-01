class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_kurasu, only: %i[create new index]

  def index
    @user = current_user
    if @user.teacher
      @meetings = Meeting.where(current_user == :user)
      @meetings = policy_scope(Meeting)
      @meeting = Meeting.new
    else
      @meetings = Meeting.where(parent_id.nil?)
      @meetings = policy_scope(Meeting)
    end
  end

  def show
  end

  def create
    @meetings = []
    meeting_creation
    @meetings.each do |meeting|
      render '/kurasus_meetings' unless meeting.save
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

  def meeting_creation
    5.times do
      @meeting = Meeting.new(meeting_params)
      @meeting.teacher = current_user
      @meeting.kurasu = Kurasu.find(params[:kurasu_id])
      authorize @meeting
      @meetings << @meeting
    end
  end

  def meeting_params
    params.require(:meeting).permit(:title, :content, :date, :parent_id)
  end

  def find_meeting
    Meeting.find(params[:id]) # TODO: change this later
  end
end
