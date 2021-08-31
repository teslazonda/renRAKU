class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_kurasu, only: %i[index create new]

  def index
    @user = current_user
    @schedules = policy_scope(Schedule)
  end

  def create
    @schedule = Schedule.new(schedule_params)
    authorize @schedule
    @schedule.kurasu = @kurasu
    if @schedule.save
      redirect_to kurasu_schedules_path(@kurasu)
    else
      render '/schedules/new'
    end
  end

  def new
    @schedule = Schedule.new
    authorize @schedule
  end

  def edit
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end

  def update
    @schedule = Schedule.find(params[:id])
    authorize @schedule
    @schedule.update(schedule_params)
    @schedule.kurasu = @kurasu
    # redirect_to kurasu_schedules_path(@kurasu)
    redirect_to edit_schedule(@schedule)
  end

  private

  def find_kurasu
    @kurasu = Kurasu.find(params[:kurasu_id])
  end

  def schedule_params
    params.require(:schedule).permit(:photo, :kurasu_id)
  end

end
