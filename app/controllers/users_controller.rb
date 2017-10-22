class UsersController < ApplicationController
  def index
    # very inefficient but not a problem considering the low volume of data
    @users = User.joins(:presentations).group('users.id').order("count(users.id) DESC")
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
