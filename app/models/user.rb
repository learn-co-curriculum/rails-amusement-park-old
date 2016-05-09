class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides


  def mood
    return nil if self.admin
    if self.happiness < self.nausea
      "sad"
    else
      "happy"
    end
  end

end
