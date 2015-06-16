require_relative 'ship'

class Board

attr_accessor :board

def initialize
  @board = []

end

def place ship
  board << ship
end

def hit position
  board.find do |ship|
    if ship.position == position
      ship.hit
      puts "HIT!"
    else
      puts "MISS!"
    end
  end
end

def all_ships_sunk?

end


def empty?
  @board.empty?
end

  # board = Array.new(10, " ").map {|row| Array.new(10, " ")}

end
