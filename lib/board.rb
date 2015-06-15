class Board

  attr_reader :dimension
  attr_accessor :playing_on

  def initialize dimension
    @dimension = dimension
    @playing_on = create_blank_board
  end

  def place ship, coordinate, direction
    playing_on[coordinate] = ship
  end

  def ship_at? coordinate
    playing_on[coordinate] != :water
  end

  private

  def create_blank_board
    # Making a Hash with all the coordinates of the board as keys setting them to value 'water'
    coordinate_keys  = (0..@dimension[0]-1).to_a.product((0..@dimension[1]-1).to_a)
    value_water = [:water] * coordinate_keys.count
    Hash[coordinate_keys.zip(value_water)]
  end

end
