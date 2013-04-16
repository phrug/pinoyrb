class PagesController < ApplicationController
  def index
    @next_meetup = Event.upcoming.meetups.first
  end
end
