class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @attractions_active = "active"
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.create(params_require)
    flash[:success] = "Congrats. You've sucessfully created an attraction."
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(params_require)
    @attraction.save
    flash[:success] = "Congrats. You've sucessfully updated the user."
    redirect_to attraction_path(@attraction)
  end

  def destroy
  end

  def ride
    user = @current_user
    ride = Attraction.find(params[:id])
    r = Ride.new
    r.user = user
    r.attraction = ride
    r.save
    message = r.take_ride_with_message
    flash[message[0]] = message[1]

    redirect_to user_path(user)
  end

  def params_require
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end