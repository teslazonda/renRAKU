class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      @kurasus = Kurasu.all
      render '/events/new'
    end
  end

  def new
    @event = Event.new
    @event.participants.build
    @kurasus = Kurasu.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :date, participants_attributes: [:kurasu_id])
  end

end
