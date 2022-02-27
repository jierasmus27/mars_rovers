# frozen_string_literal: true

require_relative '../location'
require_relative '../orientation'
require_relative '../mission'
require_relative '../mission_report'
require_relative '../plateau'
require_relative '../rover'

describe MissionReport do
  subject(:mission_report) { described_class.new(mission) }
  let(:mission) { Mission.new(rovers: [rover, other_rover], instructions: nil, plateau: nil) }
  let(:rover) do
    Rover.new(location: Location.new(1, 1), orientation: Orientation.new('N'))
  end
  let(:other_rover) do
    Rover.new(location: Location.new(2, 2), orientation: Orientation.new('S'))
  end

  describe '#print' do
    it 'prints the result to stdout' do
      expectation = expect { mission_report.print }
      expectation.to output(/1 1 N\n/).to_stdout
      expectation.to output(/2 2 S\n/).to_stdout
    end
  end
end
