# frozen_string_literal: true

require_relative '../plateau'
require_relative '../location'
require_relative '../rover'
require_relative '../orientation'

describe Plateau do
  subject(:plateau) { described_class.new(max_location) }
  let(:max_location) { Location.new(5, 5) }

  describe '#place' do
    context 'on valid locations' do
      before do
        plateau.place(rover)
      end

      let(:rover) do
        Rover.new(location: Location.new(1, 1), orientation: Orientation.new('N'))
      end

      it { expect(plateau.grid[1][1]).to include rover }
    end

    context 'on invalid locations' do
      let(:rover) do
        Rover.new(location: Location.new(-1, 1), orientation: Orientation.new('N'))
      end

      it 'raises an error' do
        expect{ plateau.place(rover) }.to raise_error 'Rover starting off the grid'
      end
    end
  end

  describe '#move' do
    before do
      plateau.place(rover)
    end

    context 'to valid locations' do
      before do
        plateau.move(rover, rover.next_location)
      end

      let(:rover) do
        Rover.new(location: Location.new(1, 1), orientation: Orientation.new('N'))
      end

      it { expect(plateau.grid[1][2]).to include rover }
    end

    context 'to invalid locations' do
      let(:rover) do
        Rover.new(location: Location.new(1, 1), orientation: Orientation.new('N'))
      end

      it 'raises an error' do
        expect { plateau.move(rover, [-1, 1]) }.to raise_error 'Rover moving off the grid'
      end
    end
  end

  describe '#off_the_grid?' do
    subject { plateau.off_the_grid?(location) }

    context 'x is less than 0' do
      let(:location) { Location.new(-1, 0) }

      it { is_expected.to be true }
    end

    context 'y is less than 0' do
      let(:location) { Location.new(0, -1) }

      it { is_expected.to be true }
    end

    context 'x is larger than max_location' do
      let(:location) { Location.new(max_location.x + 1, 0) }

      it { is_expected.to be true }
    end

    context 'y is larger than max_location' do
      let(:location) { Location.new(0, max_location.y + 1) }

      it { is_expected.to be true }
    end

    context 'location is valid' do
      let(:location) { Location.new(1, 0) }

      it { is_expected.to be false }
    end
  end
end
