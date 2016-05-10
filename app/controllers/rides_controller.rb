class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end


  def create
    @ride = Ride.create(ride_params)
    @ride.save 

    redirect_to current_user
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end