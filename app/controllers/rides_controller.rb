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
    x = @ride.take_ride
    case x
    when "Sorry. You are not tall enough to ride the #{a.name} and, you do not have enough tickets to ride the #{a.name}"
      flash[:notice] = "#{x}"
    when "Sorry. You are not tall enough to ride the #{a.name}"
      flash[:notice] = "#{x}"
    when "Sorry. You do not have enough tickets to ride the #{a.name}"
      flash[:notice] = "#{x}"
    when "Thanks for riding the #{a.name}!"
      flash[:notice] = "#{x}"
    end
  end
end
