class RidesController < ApplicationController
  before_action :set_user
  
  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride
    flash[:notice] = @ride.ride_message
    redirect_to user_path(@ride.user)
  end

end
