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

  def hit
    @status = :sunk
  end

end
