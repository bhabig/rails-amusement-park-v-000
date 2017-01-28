class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.nausea < self.happiness
      "happy"
    elsif self.nausea > self.happiness
      "sad"
    end
  end

  def update_user_tickets(params)
    u = User.find_by(id: params[:user_id])
    a = Attraction.find_by(id: params[:attraction_id])
    u.tickets -= a.tickets
    u.save
  end

  def update_user_mood(params)
    u = User.find_by(id: params[:user_id])
    a = Attraction.find_by(id: params[:attraction_id])
    u.nausea += a.nausea_rating
    u.save
  end

  def update_user_attribute(params)
    #can use interpolation to find a way to consolidate above two methods into 1
  end
end
