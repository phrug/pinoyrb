class UsersController < ApplicationController
  def index
    # very inefficient but not a problem considering the low volume of data
    @users = User.includes(:presentations).all.sort_by do |user|
      -user.presentations.count
    end.reject { |user| user.presentations.count < 1 }
  end

  def show
    @user = User.find(params[:id])
  end
end
