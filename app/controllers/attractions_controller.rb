class AttractionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def edit
  end

  def create
    @attraction = Attraction.create(params_require)
    flash[:success] = "Congrats. You've sucessfully created an attraction."
    redirect_to attractions_path(@attraction)
  end

  def update
  end

  def destroy
  end

  def params_require
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end