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

  def show
    if logged_in?
      @attraction = Attraction.find_by(id: params[:id])
      @user = current_user
    else
      redirect_to root_path
    end
  end

  
end
