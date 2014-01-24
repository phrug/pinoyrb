class UsersController < ApplicationController
  def index
    # very inefficient but not a problem considering the low volume of data
    @users = User.includes(:presentations).order(:name).load
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
