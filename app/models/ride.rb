class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.height >= attraction.min_height && user.tickets >= attraction.tickets
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
      "Thanks for riding #{attraction.name}!"
    elsif user.height < attraction.min_height && user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end
