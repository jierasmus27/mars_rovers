# frozen_string_literal: true

require_relative './location'
require_relative './orientation'
require_relative './plateau'
require_relative './rover'

class MissionPlan
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def setup
    place_rovers

    {
      plateau: plateau,
      rovers: rovers,
      instructions: instructions
    }
  end

  private

  def plateau
    @plateau ||= Plateau.new(Location.new(*max_location))
  end

  def place_rovers
    rovers.each { |rover| plateau.place(rover) }
  end

  def rovers
    @rovers ||=
      [].tap do |rovers|
        rover_locations.each do |location|
          x, y, direction = location

          rovers << Rover.new(
            location: Location.new(x, y),
            orientation: Orientation.new(direction)
          )
        end
      end
  end

  def max_location
    input[:max_location].split(/ /)
  end

  def rover_locations
    input[:rover_data].collect { |r| r[:location].split(/ /) }
  end

  def instructions
    input[:rover_data].collect { |r| r[:instructions].split(//) }
  end
end
