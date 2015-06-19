require_relative 'ship'

class Board

  attr_reader :board, :dimension

  def initialize dimension =10
    @dimension = dimension
    @board = []
  end

  def place ship
    fail 'Ship is outside the board' if outside_board? ship
    fail 'There is a ship already there!' if position_occupied? ship
    board << ship
  end

  def strike coordinate

    if all_ships_positions.include? (coordinate)
       board.select {|ship| ship.position.include?(coordinate)}[0].hit
      "HIT!"
    else
      "MISS!"
    end
  end
    # board.map {|ship| ship.position} mapping out the positions of the ships in the board array [the mapped array is an array of arrays with each ship locations as an element] because we've specified ship.position as the parameter
    # we need to use flatten in order for the mapped out "array of arrays" that is being produced with ship coordinates to become a single array containing ALL coordinates as individual elements
    # we are checking with "include?" if the coordinate that is being struck is present in the mapped out array, and the include statement returns true/false
    # if it is true, the next line of code will execute
    # board.select will select a ship from the board array based on a condition, in this case the coordinate we are passing as an argument.
    # board.select is pulling out each ship from the board array, if the ship's position is included in the coordinate given, it will SELECT it and create an array with that result.
    # the reason the [0] is there at the end is because an array is produced and you must .hit the first (and only) element

    # select returns |ship| based on the condition given after it
    # map is going to look at each |ship| and return ship.position

  def all_ships_sunk?
    board.all? {|ship| ship.status == :sunk}
  end

  def empty?
    @board.empty?
  end

  def position_occupied? ship
    !(all_ships_positions & ship.position).empty?
  end
    # board.position_occupied? ship
    # this method is testing whether or not the position you're trying to place 'ship' on is occupied.
    # we are flattening the array that is returned by board.map (which creates a new array with arrays of ship positions)
    # the ship.position is the position of the ship we are trying to place, which is an array itself.
    # we are then using the 'intersect' method - & - which will return any commonality between the two arrays
    # if the two arrays intersect it means a ship is already in the position you're trying to place your next ship, and the array will not be empty.
    # if there is no intersection between the two arrays, you can place your ship

    # what we want to test is that the 'intersection array' is NOT empty - hence the bang.
    # if the intersection array is empty, the condition returns false, which means that position is NOT occupied and you can place your ship

  def outside_board? ship
    (last_x_coordinate_outside? ship) || (last_y_coordinate_outside? ship)
  end
    # this method is testing whether the 'ship' is outside the board.
    # we are 'checking' whether the _last_ element in the 'ship position array' is outside of the board, because if it is - the ship is definitely outside the board.
    # considering _last_ does not return an array, just the string with a letter "C" and number "4", we need to use regular expressions.
    # passing .scan(/[A-Z]/).join and .scan(/[0-9]/).join to produce an array of matches and joining them
    # the "C" in "C4" is the x-coordinate, and the "4" is the y-coordinate.
    # therefore if the x coordinate of the ship is > the last column, it must be outside the board.
    # to account for when our board is larger than the alphabet
    # we need to test if the number of letters in the x coordinate is greater than our last column such that,
    # for example "AA" > "Z"
    # same with the y coordinate and the last row.

  private

  def last_x_coordinate_outside? ship
    last_column_on_board = bottom_right_letter

    to_check = ship.position.last
    x_coordinate_of_ship = to_check.scan(/[A-Z]/).join

    x_coordinate_of_ship.length > last_column_on_board.length || x_coordinate_of_ship > last_column_on_board
  end

  def last_y_coordinate_outside? ship
    last_row_on_board = dimension

    to_check = ship.position.last
    y_coordinate_of_ship = (to_check.scan(/[0-9]/).join).to_i

    y_coordinate_of_ship > last_row_on_board
  end

  def alphabet
    num_of_Z = 'Z' * (dimension/26 + 1)
    alphabet = ('A'..num_of_Z).to_a
  end

  def bottom_right_letter
    alphabet[dimension]
  end

  def all_ships_positions
    board.map{|ship| ship.position}.flatten
  end

end
