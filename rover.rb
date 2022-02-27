# frozen_string_literal: true

class Rover
  attr_reader :location, :orientation

  def initialize(location:, orientation:)
    @location = location
    @orientation = orientation
  end

  def perform(instruction)
    case instruction
    when 'L', 'R'
      turn(instruction)
    when 'M'
      move
    end
  end

  def direction
    orientation.direction
  end

  def next_location
    location.next(delta)
  end

  private

  def turn(side)
    orientation.turn(side)
  end

  def move
    @location = next_location
  end

  def delta
    case orientation.direction
    when 'N'
      [0, 1]
    when 'S'
      [0, -1]
    when 'E'
      [1, 0]
    when 'W'
      [-1, 0]
    end
  end
end
