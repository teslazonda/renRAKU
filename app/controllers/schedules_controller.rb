class SchedulesController < ApplicationController
  before_action :find_kurasu, only: %i[index update edit]

  def index
    @user = current_user
    @schedules = policy_scope(Schedule)
  end

  def update
    @schedule = Schedule.find(params[:id])
    authorize @schedule
    @schedule.update(schedule_params)
    redirect_to schedules_path
  end

  def edit
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end

  def new
    @schedule = Schedule.new
    authorize @schedule
  end

  private

  def find_kurasu
    @kurasu = Kurasu.find(params[:kurasu_id])
  end

  def schedule_params
    params.require(:schedule).permit(:photo, :kurasu_id)
  end

end
