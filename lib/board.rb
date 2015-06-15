require_relative 'ship'

class Board

  attr_reader :dimension
  attr_accessor :playing_on

  def initialize dimension
    @dimension = dimension
    @playing_on = create_blank_board
  end

  def place ship, coordinate, orientation
    orientation == 'horizontal' ? index = 1 : index = 0
    ship.size.times do
      playing_on[coordinate] = ship
      coordinate[index] += 1
    end
  end

  def ship_at? coordinate
    playing_on[coordinate] != :water
  end

  def where_ship ship
    playing_on.select{ |coord, value| value == ship }.keys
  end

  private

  def create_blank_board
    # Making a Hash with all the coordinates of the board as keys setting them to value 'water'
    coordinate_keys  = (0..dimension[0]-1).to_a.product((0..dimension[1]-1).to_a)
    value_water = [:water] * coordinate_keys.count
    Hash[coordinate_keys.zip(value_water)]
  end

end
