class SchedulesController < ApplicationController
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
    @kurasus = Kurasu.all
    @schedule.participants = []
    @schedule.participants.build
    authorize @schedule
  end

  def new
    @schedule = Schedule.new
    @kurasus = Kurasu.all
    @schedule.participants.build
    authorize @schedule
  end

end
