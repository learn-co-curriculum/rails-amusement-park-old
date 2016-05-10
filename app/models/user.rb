class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if self.happiness != nil
      if self.happiness > self.nausea
        mood = "happy"
      else
        mood = "sad"
      end
    end
  end

end
