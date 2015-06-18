module Ship_creation_module

  def aircraft_carrier starting_point, orientation
    self.new starting_point, 5, orientation
  end

  def battleship starting_point, orientation
    self.new starting_point, 4, orientation
  end

  def submarine starting_point, orientation
    self.new starting_point, 3, orientation
  end

  def destroyer starting_point, orientation
    self.new starting_point, 3, orientation
  end

  def boat starting_point, orientation
    self.new starting_point, 2, orientation
  end


end
