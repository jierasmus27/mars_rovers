# frozen_string_literal: true

require_relative '../mission'
require_relative '../plateau'
require_relative '../location'
require_relative '../rover'
require_relative '../orientation'

describe Mission do
  subject(:mission) do
    described_class.new(
      plateau: plateau,
      instructions: instructions,
      rovers: rovers
    )
  end
  let(:plateau) { Plateau.new(Location.new(5, 5)) }
  let(:rovers) do
    [
      Rover.new(location: Location.new(1, 2), orientation: Orientation.new('N')),
      Rover.new(location: Location.new(3, 3), orientation: Orientation.new('E'))
    ]
  end
  let(:instructions) do
    [
      'LMLMLMLMM'.split(//),
      'MMRMMRMRRM'.split(//)
    ]
  end

  describe '#start' do
    before do
      mission.start
    end

    context 'for valid (default) instructions' do
      it 'moves the first rover correctly' do
        expect(rovers[0].location.to_a).to eq [1, 3]
        expect(rovers[0].direction.to_s).to eq 'N'
      end

      it 'moves the second rover correctly' do
        expect(rovers[1].location.to_a).to eq [5, 1]
        expect(rovers[1].direction.to_s).to eq 'E'
      end
    end

    context 'for invalid instructions - moving off the grid' do
      let(:instructions) do
        [
          ['M', 'M', 'M', 'M', 'M'],
          ['M', 'M', 'M', 'M', 'M']
        ]
      end

      it 'moves the first rover until it reaches the edge' do
        expect(rovers[0].location.to_a).to eq [1, 5]
        expect(rovers[0].direction.to_s).to eq 'N'
      end

      it 'moves the second rover until it reaches the edge' do
        expect(rovers[1].location.to_a).to eq [5, 3]
        expect(rovers[1].direction.to_s).to eq 'E'
      end
    end

    context 'for large plateaus' do
      let(:plateau) { Plateau.new(Location.new(1000, 900)) }
      let(:instructions) do
        [
          large_command,
          large_command
        ]
      end

      it 'moves the first rover which reaches the edge' do
        expect(rovers[0].location.to_a).to eq [1, 900]
        expect(rovers[0].direction.to_s).to eq 'N'
      end

      it 'moves the second rover correctly' do
        expect(rovers[1].location.to_a).to eq [904, 3]
        expect(rovers[1].direction.to_s).to eq 'E'
      end
    end

    def large_command
      ['M'].tap do |arr|
        900.times { arr << 'M' }
      end
    end
  end
end
