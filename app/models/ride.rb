class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

def take_ride
  if (self.user.tickets >= self.attraction.tickets) && (self.user.height >= self.attraction.min_height)
    # net_tickets = self.user.tickets - self.attraction.tickets
    # net_nausea = self.user.nausea + self.attraction.nausea_rating
    # net_happiness = self.user.happiness + self.attraction.happiness_rating

    self.user.update(
      tickets: user.tickets - attraction.tickets,
      nausea: user.nausea + attraction.nausea_rating,
      happiness: user.happiness + attraction.happiness_rating
    )
  else
    ride_message
  end
end
  # def take_ride
  #   if ride_errors.empty?
  #     net_tickets = self.user.tickets - self.attraction.tickets
  #     net_nausea = self.user.nausea + self.attraction.nausea_rating
  #     net_happiness = self.user.happiness + self.attraction.happiness_rating
  #
  #     self.user.update(
  #       tickets: net_tickets,
  #       nausea: net_nausea,
  #       happiness: net_happiness
  #     )
  #   else
  #     ride_errors
  #   end
  # end

  def shortness_error
    "You are not tall enough to ride the #{self.attraction.name}."
  end

  def poverty_error
    "You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def not_enough_tickets?
    self.user.tickets < self.attraction.tickets
  end

  def not_tall_enough?
    self.user.height < self.attraction.min_height
  end

  def ride_message
    @message = ""
    if not_enough_tickets? && not_tall_enough?
      @message += ("Sorry. " + poverty_error + " " + shortness_error)
    elsif not_enough_tickets?
      @message += ("Sorry. " + poverty_error)
    elsif not_tall_enough?
      @message += ("Sorry. " + shortness_error)
    else
      @message = good_ride
    end
    @message
  end

  def good_ride
    "Thanks for riding the #{self.attraction.name}!"
  end




end
