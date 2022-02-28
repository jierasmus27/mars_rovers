# frozen_string_literal: true

require_relative './mission'
require_relative './mission_plan'
require_relative './mission_report'

class UserInput
  attr_reader :input

  def self.gather_plans
    max_location = ''
    rover_data = []

    puts instruction_message

    loop do
      max_location = gather_input('Top right location (format x y) ')

      break if valid_max_location(max_location)

      puts 'Invalid format, required format (x y)'
    end

    loop do
      rover_location, rover_instructions = ''

      loop do
        rover_location = gather_input('Rover location (format: x y direction, for example 1 2 N) ')

        break if valid_rover_location(rover_location) || rover_location == start_text

        puts 'Invalid format, required format (x y direction)'
      end

      break if rover_location == start_text

      loop do
        rover_instructions = gather_input('Rover instructions (options: L, R, M, for example LRMRMM) ')

        break if valid_rover_instructions(rover_instructions) || rover_instructions == start_text

        puts 'Invalid format, required format (comination of L, R, M)'
      end

      break if rover_instructions == start_text

      rover_data << {
        location: rover_location,
        instructions: rover_instructions
      }
    end

    { max_location: max_location, rover_data: rover_data }
  end

  private

  def self.start_text
    'start'
  end

  def self.instruction_message
    "Please enter the mission details. Enter '#{start_text}' to kick off the mission"
  end

  def self.gather_input(message)
    print message
    gets.chomp
  end

  def self.valid_max_location(max_location)
    max_location.match(/^[0-9]+ [0-9]+$/)
  end

  def self.valid_rover_location(rover_location)
    rover_location.match(/^[0-9]+ [0-9]+ (N|E|S|W)$/)
  end

  def self.valid_rover_instructions(rover_instructions)
    rover_instructions.match(/^[LRM]+$/)
  end
end
