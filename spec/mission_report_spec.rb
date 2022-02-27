# frozen_string_literal: true

require_relative '../location'
require_relative '../orientation'
require_relative '../mission'
require_relative '../mission_report'
require_relative '../plateau'
require_relative '../rover'

describe MissionReport do
  subject(:mission_report) { described_class.new(mission) }
  let(:mission) { Mission.new(rovers: [rover, other_rover], instructions: nil, plateau: plateau) }
  let(:rover) do
    Rover.new(location: Location.new(1, 1), orientation: Orientation.new('N'))
  end
  let(:other_rover) do
    Rover.new(location: Location.new(2, 2), orientation: Orientation.new('S'))
  end
  let(:plateau) { Plateau.new(Location.new(5, 5)) }

  describe '#print_report' do
    before do
      allow(mission).to receive(:errors).and_return(['An error occurred'])

      plateau.place(rover)
      plateau.place(other_rover)
    end

    it 'prints the rover result to stdout' do
      expectation = expect { mission_report.print_report }
      expectation.to output(/1 1 N\n/).to_stdout
      expectation.to output(/2 2 S\n/).to_stdout
    end

    it 'prints errors to stdout' do
      expectation = expect { mission_report.print_report }
      expectation.to output(/An error occurred\n/).to_stdout
    end

    it 'prints a grid to stdout' do
      grid =
        " - - - - - -\n" +
        " - - - - - -\n" +
        " - - - - - -\n" +
        " - - S - - -\n" +
        " - N - - - -\n" +
        " - - - - - -\n"

      expectation = expect { mission_report.print_report }
      expectation.to output(/#{grid}/).to_stdout
    end
  end
end
