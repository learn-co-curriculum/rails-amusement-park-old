class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :set_user


  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :min_height, :tickets)
  end
end
