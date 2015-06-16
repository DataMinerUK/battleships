class Ship

#can be hit
#knows when it has been sunk
#can change sizes? or different classes for each ship?
attr_reader :status
attr_reader :position
attr_reader :hits


  def initialize position
    @position = position
    @status = :floating
    @hits = 0
  end

  def hit
    @status = :sunk
    @hits += 1
  end

end
