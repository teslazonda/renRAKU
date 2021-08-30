class SchedulesController < ApplicationController
  def index
    @user = current_user
    @schedules = policy_scope(Schedule)
    @kurasu = Kurasu.find(params[:kurasu_id])
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
    authorize @schedule
    @schedule.participants = []
    @schedule.participants.build
  end

  def new
    @schedule = Schedule.new
    authorize @schedule
    @kurasus = Kurasu.all
    @schedule.participants.build
  end

end
