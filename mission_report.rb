# frozen_string_literal: true

class MissionReport
  attr_reader :mission

  def initialize(mission)
    @mission = mission
  end

  def print
    rover_positions.each do |position|
      puts position
    end
  end

  private

  def rover_positions
    mission.rovers.collect { |rover| "#{rover.location} #{rover.orientation}" }
  end
end