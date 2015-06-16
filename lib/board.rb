require_relative 'ship'

class Board

attr_accessor :board

def initialize
  @board = []

end

def place ship
  board << ship
  # .position
end

def hit position
  # board.include?(position) ? 'HIT!' : 'MISS!'
  board.each { |ship| ship.hit if ship.position == position }
end

def all_ships_sunk

end


def empty?
  @board.empty?
end

  # board = Array.new(10, " ").map {|row| Array.new(10, " ")}

end