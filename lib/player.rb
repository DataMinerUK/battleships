class Player

  attr_reader :hits

  def initialize board
    @board = board
    @hits = []
  end

  # def place ship
  #   @board.place ship
  # end

  def lost?
    @board.all_ships_sunk?
  end

  def receive_strike coordinate
    hits << coordinate
    @board.strike coordinate
  end


end
