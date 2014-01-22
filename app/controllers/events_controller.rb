class EventsController < ApplicationController
  def index
    @upcoming = Event.upcoming
    @current = Event.current
    @past = Event.past
  end

  def show
    @event = Event.include_children.friendly.find(params[:id])
    unless @event.venue.nil?
      @hash = Gmaps4rails.build_markers(@event.venue) do |venue, marker|
        marker.lat venue.latitude
        marker.lng venue.longitude
        marker.infowindow render_to_string(:partial => "venues/infowindow", :layout => false, :locals => { :venue => venue })
        marker.json({ :id => venue.slug })
      end
    end
  end
end
