# frozen_string_literal: true

require_relative '../location'

describe Location do
  subject(:location) { described_class.new(2, 2) }

  describe '#next' do
    let(:delta) { [-1, -1] }

    it { expect(location.next(delta).to_a).to eq [1, 1] }
  end

  describe '#to_a' do
    it { expect(location.to_a).to eq [2, 2] }
  end
end
