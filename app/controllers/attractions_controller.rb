class AttractionsController < ApplicationController

   before_action :set_user, only: [:show, :update, :edit]

  def index
    @attraction = Attraction.all
  end

  def show
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
  end

  def update
    @attraction.update(attraction_params)

    redirect_to @attraction, notice: "Attraction was successfully updated."
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

  def set_params
    @attraction = Attraction.find(params[:id])
  end
end