require_relative 'board'

class Player

  attr_reader :hits, :misses

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
    fail "You have already shot here" if hits_and_misses.include? coordinate
    shot = @board.strike coordinate
    shot == 'HIT!' ? hits << coordinate : misses << coordinate
    lost? ? 'GAME OVER!' : shot
  end




  private

  def hits_and_misses
    hits + misses
  end


end
