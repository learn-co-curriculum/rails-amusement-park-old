class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end


  def create
    @ride = Ride.create(ride_params)
    @ride.user_id = current_user.id
    @ride.save 

    flash[:notice] = @ride.take_ride 

    redirect_to current_user

  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end