class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    @errors = []
    tickets
    height
    if @errors.empty?
      nausea
      happy
    end
    message
  end

  def message
    if @errors.empty?
      "Thanks for riding the #{attraction.name}!"
    else
      "Sorry. " + @errors.join(" ")
    end

  end

  def tickets
    if user.tickets < attraction.tickets
      @errors << "You do not have enough tickets the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.save
    end
  end

  def height
    if user.height <= attraction.min_height
      @errors << "You are not tall enough to ride the #{attraction.name}."
    end
  end

  def nausea
    user.nausea += attraction.nausea_rating
    user.save
  end

  def happy
    user.happiness += attraction.happiness_rating
    user.save
  end

end
