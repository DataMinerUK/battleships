class Board

  attr_reader :board
  attr_reader :dimension

  def initialize dimension=10
    @dimension = dimension
    @board = []
  end

  def bottom_right
    alphabet[dimension-1] + (dimension - 1).to_s
  end

  def place ship
    fail 'Ship is outside the board' if outside_board? ship
    fail 'There is a ship already there!' if position_occupied? ship
    board << ship
  end

  def strike coordinate

    if board.map {|ship| ship.position}.flatten.include? (coordinate)
       board.select {|ship| ship.position.include?(coordinate)}[0].hit
      "HIT!"
    else
      "MISS!"
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

  end

  def all_ships_sunk?
    board.all? {|ship| ship.status == :sunk}
  end

  def empty?
    @board.empty?
  end

  def outside_board? ship
    last_row = dimension - 1
    last_column = alphabet[dimension-1].upcase

    to_check = ship.position.last
    x_coordinate_of_ship = to_check.gsub(/[^A-Z]/, '')
    y_coordinate_of_ship = to_check.gsub(/[^0-9]/, '').to_i

    (x_coordinate_of_ship > last_column) || (y_coordinate_of_ship > last_row)
  
    # this method is testing whether the 'ship' is outside the board.
    # we are 'checking' whether the _last_ element in the 'ship position array' is outside of the board, because if it is - the ship is definitely outside the board.
    # considering _last_ does not return an array, just the string with a letter "C" and number "4", we need to use regular expressions.
    # passing .gsub(/[^A-Z]/, '') and .gsub(/[^0-9]/, '').to_i) uses ^ to find and extract ONLY the respective letters or numbers.
    # the "C" in "C4" is the x-coordinate, and the "4" is the y-coordinate.
    # therefore if the x coordinate of the ship is > the last column, it must be outside the board.
    # same with the y coordinate and the last row.

  end

  def position_occupied? ship
    !(board.map {|ship| ship.position}.flatten & ship.position).empty?
  
    # board.position_occupied? ship
    # this method is testing whether or not the position you're trying to place 'ship' on is occupied.
    # we are flattening the array that is returned by board.map (which creates a new array with arrays of ship positions)
    # the ship.position is the position of the ship we are trying to place, which is an array itself.
    # we are then using the 'intersect' method - & - which will return any commonality between the two arrays
    # if the two arrays intersect it means a ship is already in the position you're trying to place your next ship, and the array will not be empty.
    # if there is no intersection between the two arrays, you can place your ship
    
    # what we want to test is that the 'intersection array' is NOT empty - hence the bang.
    # if the intersection array is empty, the condition returns false, which means that position is NOT occupied and you can place your ship 

  end

    private

    def alphabet
      alphabet = ('A'..'Z').to_a
    end

end
