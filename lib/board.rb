require_relative 'ship'

class Board

attr_accessor :board

def initialize
  @board = []

end

def place ship
  board << ship
end

def hit coordinate
  if board.map {|ship| ship.position}.include? (coordinate)
     board.select {|ship| ship.position == coordinate}[0].hit
    "HIT!"
  else
    "MISS!"
  end

# board.find {|ship| ship.}
  # board.find do |ship|
  #   if ship.position == position
  #     ship.hit
  #     puts "HIT!"
  #   else
  #     puts "MISS!"
  #   end
  # end
end

def all_ships_sunk?
  board.all? {|ship| ship.status == :sunk} 
end


def empty?
  @board.empty?
end

  # board = Array.new(10, " ").map {|row| Array.new(10, " ")}

end
