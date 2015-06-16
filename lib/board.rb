class Board

attr_reader :board

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

end

def all_ships_sunk
   if board.all? {|ship| ship.status == :sunk}
     'You win! All ships have been sunk BIOTCH'
   else
     "Keep playing. Ships be floatin'"
   end
end


def empty?
  @board.empty?
end

  # board = Array.new(10, " ").map {|row| Array.new(10, " ")}

end
