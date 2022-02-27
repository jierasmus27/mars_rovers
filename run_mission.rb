# frozen_string_literal: true

require_relative 'mission'
require_relative 'mission_plan'
require_relative 'mission_report'
require_relative 'user_input'

class RunMission
  def self.start
    mission_plans = UserInput.gather_plans

    mission_setup = MissionPlan.new(mission_plans).setup

    mission = Mission.new(
      rovers: mission_setup[:rovers],
      plateau: mission_setup[:plateau],
      instructions: mission_setup[:instructions]
    )
    mission.start

    MissionReport.new(mission).print
  rescue StandardError => e
    puts "The mission failed: #{e.message}"
  end
end

RunMission.start
