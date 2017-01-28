class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    a = Attraction.find_by(id: self.attraction_id)
    u = User.find_by(id: self.user_id)

    if a.min_height > u.height && a.tickets > u.tickets
      return "Sorry.You do not have enough tickets to ride the #{a.name} and, you are not tall enough to ride the #{a.name}"
    elsif a.min_height > u.height
      return "Sorry. You are not tall enough to ride the #{a.name}"
    elsif a.tickets > u.tickets
      return "Sorry. You do not have enough tickets to ride the #{a.name}"
    else
      u.attributes_adjustment(a)
      return "Thanks for riding the #{a.name}!"
    end
  end
end
