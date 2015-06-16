class Ship

#can be hit
#knows when it has been sunk
#can change sizes? or different classes for each ship?
attr_reader :status
attr_reader :position
attr_reader :hits
attr_reader :size
attr_reader :orientation


  def initialize position, size, orientation
    @position = position
    @size = size
    @orientation = orientation
    @status = :floating
    @hits = 0
  end

  def hit
    @status = :sunk
    @hits += 1
  end



end
