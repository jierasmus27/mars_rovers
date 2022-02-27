# frozen_string_literal: true

require_relative 'mission'
require_relative 'mission_plan'
require_relative 'mission_report'
require_relative 'user_input'

require "byebug"

class RunMission
  def self.start
    input = UserInput.gather_plans

    params = MissionPlan.new(input).setup

    mission = Mission.new(
      rovers: params[:rovers],
      plateau: params[:plateau],
      instructions: params[:instructions]
    )
    mission.start

    MissionReport.new(mission).print
  end
end

RunMission.start
