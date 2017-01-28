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

  def update_user_tickets(a)
    self.tickets -= a.tickets
    self.save
  end

  def update_user_mood(a)
    self.nausea += a.nausea_rating
    self.save
  end

  def update_user_happiness(a)
    self.happiness += a.happiness_rating
    self.save
  end

  def attributes_adjustment(a)
    self.update_user_tickets(a)
    self.update_user_mood(a)
    self.update_user_happiness(a)
  end


  def update_user_attribute(params)
    #can use interpolation to find a way to consolidate above two methods into 1
  end
end
