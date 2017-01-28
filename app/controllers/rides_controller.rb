class RidesController < ApplicationController
  def create
    if logged_in?
      @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      flash_notices
      redirect_to user_path(current_user)
    end
  end

  private

  def flash_notices
    a = Attraction.find_by(id: params[:attraction_id])
    if a.min_height > current_user.height && a.tickets > current_user.tickets
      flash[:notice] = "You are not tall enough to ride the #{a.name} & You do not have enough tickets to ride the #{a.name}"
      #flash[:notice] = ""
    elsif a.min_height > current_user.height
      flash[:notice] = "You are not tall enough to ride the #{a.name}"
    elsif a.tickets > current_user.tickets
      flash[:notice] = "You do not have enough tickets to ride the #{a.name}"
    else
      attributes_adjustment
      flash[:notice] = "Thanks for riding the #{a.name}!"
    end
  end

  def attributes_adjustment
    current_user.update_user_tickets(params)
    current_user.update_user_mood(params)
  end

end
