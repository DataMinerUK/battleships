class Player

  attr_reader :hits
  attr_reader :misses

  def initialize board
    @board = board
    @hits = []
    @misses = []
  end

  def place ship
    @board.place ship
  end

  def lost?
    @board.all_ships_sunk?
  end

  def receive_strike coordinate
    shot = @board.strike coordinate
    if shot == 'HIT!'
      hits << coordinate
    else shot == 'MISS!'
      misses << coordinate
    end
    shot
  end

end
