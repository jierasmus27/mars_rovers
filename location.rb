class Location
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x.to_i
    @y = y.to_i
  end

  def next(delta)
    Location.new(x + delta[0], y + delta[1])
  end

  def to_s
    "#{x} #{y}"
  end

  def to_a
    [x, y]
  end
end