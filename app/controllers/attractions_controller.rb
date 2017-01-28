class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.none
    if logged_in?
      @attractions = Attraction.all
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    if logged_in?
      @attraction = Attraction.find_by(id: params[:id])
      @user = current_user
    else
      redirect_to root_path
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
