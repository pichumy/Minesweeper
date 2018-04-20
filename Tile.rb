
class Tile

  attr_reader :bomb 

  def initialize(val)
    @value = val
    @display = " "
    @bomb = true if val == :b
  end

  def reveal
    @display = @value
  end

  def to_s
    @display
  end

  def inspect
    @display
  end


end
