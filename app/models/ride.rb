class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if user.height >= min_height && user.tickets >= tickets
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      flash[:error] = "Thanks for riding #{attraction.name}!"
    elsif user.tickets < tickets
      flash[:error] = "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif user.height < height
      flash[:error] = "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
  end
end
