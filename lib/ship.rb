class Ship

#can be hit
#knows when it has been sunk
#can change sizes? or different classes for each ship?
attr_reader :status
attr_reader :position
attr_reader :hits
attr_reader :size
attr_reader :orientation
attr_reader :starting_point


 # orientation can be ANY string - problem. 

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
    to_change = (letter if orientation == :vertical) || (number if orientation == :horizontal)

      size.times do
      positions_array << letter + number
      to_change.next!
      end
  
    positions_array

  end

end
