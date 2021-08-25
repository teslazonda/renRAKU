class EventsController < ApplicationController

  def index
    @events = policy_scope(Event)
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      redirect_to events_path
    else
      @kurasus = Kurasu.all
      @event.participants = []
      @event.participants.build
      render '/events/new'
    end
  end

  def new
    @event = Event.new
    @kurasus = Kurasu.all
    @event.participants.build
    authorize @event
  end

  def delete

  end

  private

  def event_params
    params.require(:event).permit(:title, :rich_body, :content, :photo, :date, participants_attributes: [:kurasu_id])
  end

end
