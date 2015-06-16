class Player

  def initialize board
    @board = board
  end

  # def place ship
  #   @board.place ship
  # end

  def lost?
    @board.all_ships_sunk?
  end

  def receive_strike coordinate

  end


end
