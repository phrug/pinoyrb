class EventsController < ApplicationController
  def index
    @upcoming = Event.upcoming
    @current = Event.current
    @past = Event.past
  end

  def show
    @event = Event.include_children.find(params[:id])
  end
end
