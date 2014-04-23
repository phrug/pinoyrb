class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.friendly.find(params[:id])
  end
end
