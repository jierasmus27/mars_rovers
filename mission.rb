# frozen_string_literal: true

class Mission
  attr_accessor :rovers, :instructions, :plateau

  def initialize(rovers:, instructions:, plateau:)
    @rovers = rovers
    @instructions = instructions
    @plateau = plateau
  end

  def start
    instructions.each.with_index do |instruction_set, index|
      execute_orders(rovers[index], instruction_set)
    end
  end

  private

  def execute_orders(rover, instruction_set)
    instruction_set.each do |instruction|
      plateau.move(rover, rover.next_location) if instruction == 'M'
      rover.perform(instruction)
    end
  rescue StandardError => e
    "A rover operation halted: #{e.message}"
  end
end
