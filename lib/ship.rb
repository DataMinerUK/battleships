class Ship
attr_reader :status, :position, :size, :hits, :orientation, :starting_point

  
  def initialize starting_point, size, orientation
    @starting_point = starting_point
    @size = size
    @orientation = orientation

    @position = create_position
    @status = :floating
    @hits = 0
  end

  def hit
    @hits += 1
    @status = :sunk if @hits == @size
  end

  def create_position

    # Creating the positions array (on INITIALIZATION), which must, in terms of ordering, come after starting_point, size, and orientation
    # because they need to be passed for the ship to be created.

    # the positions array takes the letter ("C") and number ("4") and splits them into two variables.
    # first we are assuming the ship is horizontal, so we will focus on the letter.next (!) is necessary to change the letter to the next letter, instead of just "returning" it
    # hence we change the letter ".next!", size number of times to create the vertical ship.

    positions_array = []
    letter = starting_point[0]
    number = starting_point[1]
    to_change = (letter if orientation == :horizontal) || (number if orientation == :vertical)

      size.times do
      positions_array << letter + number
      to_change.next!
      end

    positions_array

  end

  private 


  size = { destroyer: 3}

  def self.aircraft_carrier starting_point, orientation
    self.new starting_point, 5, orientation
  end

  def self.battleship starting_point, orientation
    self.new starting_point, 4, orientation
  end

  def self.submarine starting_point, orientation
    self.new starting_point, 3, orientation
  end

  def self.destroyer starting_point, orientation
    self.new starting_point, 3, orientation
  end

  def self.boat starting_point, orientation
    self.new starting_point, 2, orientation
  end

end
