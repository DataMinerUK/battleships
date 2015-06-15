require_relative 'board'

class Ship

#can be hit
#knows when it has been sunk
#can change sizes? or different classes for each ship?

attr_accessor :status
attr_accessor :position

  def initialize position
    @position = position
    @status = :floating
  end

  def position?
    position
  end

def hit position
  @status = :sunk
end

  # def sunk
  #   if true
  #     'ship is sunk'
  #   end
  # end



end