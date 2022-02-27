# frozen_string_literal: true

require_relative '../rover'
require_relative '../location'
require_relative '../orientation'

describe Rover do
  subject(:rover) do
    described_class.new(location: location, orientation: orientation)
  end
  let(:location) { Location.new(1, 1) }
  let(:orientation) { Orientation.new('N') }

  describe '#perform' do
    before do
      rover.perform(instruction)
    end

    context 'turning' do
      let(:instruction) { 'L' }

      it { expect(rover.direction).to eq 'W' }
    end

    context 'moving' do
      let(:instruction) { 'M' }

      it { expect(rover.location.to_a).to eq [1, 2] }
    end
  end

  describe '#next_location' do
    subject(:next_location) { rover.next_location }

    it { expect(next_location.to_a).to eq [1, 2] }
  end
end
