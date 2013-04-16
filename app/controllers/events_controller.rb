class EventsController < ApplicationController
  def index
    @upcoming = Event.upcoming
    @current = Event.current
    @past = Event.past
  end

  def show
    @event = Event.include_children.find(params[:id])
    unless @event.venue.nil?
      @gmap_json = [@event.venue].to_gmaps4rails do |venue, marker|
        marker.infowindow render_to_string(:partial => "venues/infowindow", :layout => false, :locals => { :venue => venue })
        marker.json({ :id => venue.slug })
      end
    end
  end
end
