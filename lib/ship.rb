class Ship

#can be hit
#knows when it has been sunk
#can change sizes? or different classes for each ship?
attr_reader :status
attr_reader :position
attr_reader :hits
attr_reader :size
attr_reader :orientation
attr_reader :starting_point


  def initialize starting_point, size, orientation
    @starting_point = starting_point
    @size = size
    @orientation = orientation

    @position = create_position
    @status = :floating
    @hits = 0
  end

  def hit
    @hits += 1
    @status = :sunk if @hits == @size
  end

  def create_position

    positions_array = []
    letter = starting_point[0]
    number = starting_point[1]

    size.times do
      positions_array << letter + number
      letter.next!
    end

    positions_array

  end

end
