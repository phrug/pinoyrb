class SearchesController < ApplicationController
  def show
    unless params[:q].blank?
      @events = Event.basic_search(params[:q]).where("start_at IS NOT NULL")
      @tags = Tag.basic_search(params[:q]).includes(:presentations)
      @presentations = Presentation.basic_search(params[:q])
    end
  end
end
