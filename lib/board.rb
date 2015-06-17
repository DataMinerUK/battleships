class Board

  attr_reader :board

  def initialize
    @board = []

  end

  def place ship
    board << ship
  end

  def strike coordinate
    
    # board.map {|ship| ship.position} mapping out the positions of the ships in the board array [the mapped array is an array of arrays with each ship locations as an element] because we've specified ship.position as the parameter
    # we need to use flatten in order for the mapped out "array of arrays" that is being produced with ship coordinates to become a single array containing ALL coordinates as individual elements
    # we are checking with "include?" if the coordinate that is being struck is present in the mapped out array, and the include statement returns true/false
    # if it is true, the next line of code will execute
    # board.select will select a ship from the board array based on a condition, in this case the coordinate we are passing as an argument.
    # board.select is pulling out each ship from the board array, if the ship's position is included in the coordinate given, it will SELECT it and create an array with that result.
    # the reason the [0] is there at the end is because an array is produced and you must .hit the first (and only) element

    # select returns |ship| based on the condition given after it
    # map is going to look at each |ship| and return ship.position

    if board.map {|ship| ship.position}.flatten.include? (coordinate)
       board.select {|ship| ship.position.include?(coordinate)}[0].hit
      "HIT!"
    else
      "MISS!"
    end

  end

  def all_ships_sunk?
    board.all? {|ship| ship.status == :sunk}
  end


  def empty?
    @board.empty?
  end

    # board = Array.new(10, " ").map {|row| Array.new(10, " ")}

end
