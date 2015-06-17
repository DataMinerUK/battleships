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
  end

  def position_occupied? ship
    !(board.map {|ship| ship.position}.flatten & ship.position).empty?
  end

    private

    def alphabet
      alphabet = ('A'..'Z').to_a
    end

end
