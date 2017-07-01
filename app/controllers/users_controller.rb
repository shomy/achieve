class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user,only: []

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @follwed = @user.followed_users
    @followers = @user.followers
  end

  private
  def blogs_params
    params.require(:user).permit(:id,:name,:profile_img)
  end


  def set_user
    @user = User.find(params[:id])
  end

end
