# frozen_string_literal: true

class Orientation
  DIRECTIONS = %w(N W S E).freeze

  attr_reader :direction

  def initialize(direction)
    @direction = direction
  end

  def turn(side)
    @direction = side == 'L' ? left_turn : right_turn
  end

  def to_s
    direction
  end

  private

  def current_index
    DIRECTIONS.find_index(direction)
  end

  def left_turn
    DIRECTIONS[left_turn_index]
  end

  def right_turn
    DIRECTIONS[right_turn_index]
  end

  def left_turn_index
    (current_index + 1) % 4
  end

  def right_turn_index
    (current_index - 1) % 4
  end
end
