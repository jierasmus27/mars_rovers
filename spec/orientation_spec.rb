# frozen_string_literal: true

require_relative '../orientation'

describe Orientation do
  subject(:orientation) { Orientation.new(direction) }

  describe '#turn' do
    before do
      orientation.turn(side)
    end

    context 'left from north to west' do
      let(:direction) { 'N' }
      let(:side) { 'L' }

      it { expect(orientation.direction).to eq 'W' }
    end

    context 'left from west to south' do
      let(:direction) { 'W' }
      let(:side) { 'L' }

      it { expect(orientation.direction).to eq 'S' }
    end

    context 'left from south to east' do
      let(:direction) { 'S' }
      let(:side) { 'L' }

      it { expect(orientation.direction).to eq 'E' }
    end

    context 'left from east to north' do
      let(:direction) { 'E' }
      let(:side) { 'L' }

      it { expect(orientation.direction).to eq 'N' }
    end

    context 'right from north to east' do
      let(:direction) { 'N' }
      let(:side) { 'R' }

      it { expect(orientation.direction).to eq 'E' }
    end

    context 'right from east to south' do
      let(:direction) { 'E' }
      let(:side) { 'R' }

      it { expect(orientation.direction).to eq 'S' }
    end

    context 'right from south to west' do
      let(:direction) { 'S' }
      let(:side) { 'R' }

      it { expect(orientation.direction).to eq 'W' }
    end

    context 'right from west to north' do
      let(:direction) { 'W' }
      let(:side) { 'R' }

      it { expect(orientation.direction).to eq 'N' }
    end
  end
end
