# frozen_string_literal: true

require_relative '../mission_plan'

describe MissionPlan do
  subject(:mission_plan) { described_class.new(input) }

  let(:input) do
    {
      max_location: '2 5',
      rover_data: [{
        location: '1 2 N',
        instructions: 'LLMM'
      }]
    }
  end

  describe '#setup' do
    it 'sets up the plateau' do
      params = mission_plan.setup

      expect(params[:plateau].grid.length).to eq 3
      expect(params[:plateau].grid.first.length).to eq 6
    end

    it 'sets up the rovers' do
      params = mission_plan.setup

      expect(params[:rovers].size).to eq 1
      expect(params[:rovers].first.location.to_a).to eq [1, 2]
      expect(params[:rovers].first.direction.to_s).to eq 'N'
    end

    it 'sets up the instructions array' do
      params = mission_plan.setup

      expect(params[:instructions].size).to eq 1
      expect(params[:instructions].first).to eq ['L', 'L', 'M', 'M']
    end
  end
end
