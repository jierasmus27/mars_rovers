# frozen_string_literal: true

class MissionReport
  attr_reader :mission

  def initialize(mission)
    @mission = mission
  end

  def print_report
    print_rover_positions
    print_errors
    print_plateau unless plateau_grid.size > 80
  end

  private

  def print_rover_positions
    mission.rovers.each { |rover| puts "#{rover.location} #{rover.orientation}" }
  end

  def print_errors
    mission.errors.each do |error|
      puts error
    end
  end

  def print_plateau
    inverted_grid.map do |row|
      row.map do |cell|
        print case cell.length
        when 0
          '-'.rjust(2)
        when 1
          cell.first.direction.to_s.rjust(2)
        when 2..9
          cell.length.to_s.rjust(2)
        else
          '*'.rjust(2)
        end
      end
      puts
    end
  end

  def inverted_grid
    plateau_grid.transpose.reverse
  end

  def plateau_grid
    mission.plateau.grid
  end
end