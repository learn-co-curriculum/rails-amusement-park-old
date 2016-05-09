class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  def mood
    return "unknown" if self.nausea.nil? || self.happiness.nil?
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end
end
