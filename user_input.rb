# frozen_string_literal: true

require_relative './mission'
require_relative './mission_plan'
require_relative './mission_report'

class UserInput
  attr_reader :input

  def self.gather_plans
    max_location = ''
    rover_data = []

    loop do
      max_location = gather_input('Top right location (format x, y) ')

      break if valid_max_location(max_location)
    end

    loop do
      rover_location, rover_instructions = ''

      loop do
        rover_location = gather_input('Rover location (format: x y direction, for example 1 2 N) ')

        break if valid_rover_location(rover_location) || rover_location == 'stop'
      end

      break if rover_location == 'stop'

      loop do
        rover_instructions = gather_input('rover instructions (options: L, R, M, for example LRMRMM) ')

        break if valid_rover_instructions(rover_instructions) || rover_instructions == 'stop'
      end

      break if rover_instructions == 'stop'

      rover_data << {
        location: rover_location,
        instructions: rover_instructions
      }
    end

    { max_location: max_location, rover_data: rover_data }
  end

  private

  def self.gather_input(message)
    print message
    gets.chomp
  end

  def self.valid_max_location(max_location)
    max_location.match(/^[1-8]+ [1-8]+$/)
  end

  def self.valid_rover_location(rover_location)
    rover_location.match(/^[1-8]+ [1-8]+ (N|E|S|W)$/)
  end

  def self.valid_rover_instructions(rover_instructions)
    rover_instructions.match(/^[LRM]+$/)
  end
end
