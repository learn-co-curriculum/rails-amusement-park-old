class AttractionsController < ApplicationController

  def index
    @attraction = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  #admin only

  def new
    @attraction = Attraction.new
  end 

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save

    redirect_to @attraction, notice: "Attraction was successfully created."
  end

  def edit
    @attraciton = Attraction.find([params[:id])
  end

  def update
    @attraction.find(params[:id])
    @attraction.update(attraction_params)

    redirect_to @attraction, notice: "Attraction was successfully updated."
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    
  end
end