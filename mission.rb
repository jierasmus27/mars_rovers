# frozen_string_literal: true

class Mission
  attr_accessor :rovers, :instructions, :plateau, :errors

  def initialize(rovers:, instructions:, plateau:)
    @rovers = rovers
    @instructions = instructions
    @plateau = plateau
    @errors = []
  end

  def start
    instructions.each.with_index do |instruction_set, index|
      execute_orders(rovers[index], instruction_set)
    rescue StandardError => e
      @errors << "Rover #{index} stopped: #{e.message}"
    end
  end

  private

  def execute_orders(rover, instruction_set)
    instruction_set.each do |instruction|
      plateau.move(rover, rover.next_location) if instruction == 'M'
      rover.perform(instruction)
    end
  end
end
