# frozen_string_literal: true

require "byebug"

class Plateau
  attr_reader :grid

  def initialize(max_location)
    @grid = Array.new(max_location.x + 1) { Array.new(max_location.y + 1) { Array.new } }
  end

  def place(rover)
    raise 'Rover starting off the grid' if off_the_grid?(rover.location)

    x, y = rover.location.to_a

    grid[x][y] << rover
  end

  def move(rover, location)
    raise 'Rover moving off the grid' if off_the_grid?(location)

    x, y = location.to_a
    from_x, from_y = rover.location.to_a

    grid[x][y] << grid[from_x][from_y].delete(rover)
  end

  def off_the_grid?(location)
    x, y = location.to_a

    x >= grid.length ||
      y >= grid.first.length ||
      x < 0 ||
      y < 0
  end
end
