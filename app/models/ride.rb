class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !ticket_check && !height_check
      (:danger, "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}.")
    elsif !ticket_check
      (:danger, "Sorry. You do not have enough tickets the #{attraction.name}.")
    elsif !height_check
      (:danger, "Sorry. You are not tall enough to ride the #{attraction.name}.")
    else
      ticket_update
      nausea_update
      happiness_update
      user.save
      (:success, "Thanks for riding the #{attraction.name}!")
    end
  end

  private
  def ticket_check
    user.tickets >= attraction.tickets
  end

  def height_check
    user.height >= attraction.min_height
  end


  def ticket_update
    user.tickets -= attraction.tickets
  end

  def nausea_update
    user.nausea += attraction.nausea_rating
  end

  def happiness_update
    user.happiness += attraction.happiness_rating
  end


end
