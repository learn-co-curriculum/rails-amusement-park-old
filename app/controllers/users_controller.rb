class UsersController < ApplicationController
  #before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @ride = @user.rides.new
    @ride.attraction_id = params[:attraction_id]
    @ride.take_ride
    @user.save
    flash[:notice] = @ride.message
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
