class AttractionsController < ApplicationController
  skip_before_action :logged_in?, only: [:index, :root_path, :new_user_path]
  
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
    redirect_to attractions_path(@attraction)
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

  def params_require
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end