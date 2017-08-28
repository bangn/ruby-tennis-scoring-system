# frozen_string_literal: true

require 'player'
require 'referee'

describe Referee do
  let(:nadal) { Player.new('Nadal', 0, 0) }
  let(:federer) { Player.new('Federer', 0, 0) }
  let(:referee) { Referee.new(nadal, federer) }

  context 'not a tie break' do
    context 'no player has win a point' do
      it 'returns initial score of the match' do
        expect(referee.score).to eq('0-0')
      end
    end

    context 'Nadal win a point' do
      it 'returns 15 for Nadal' do
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('0-0, 15-0')
      end
    end
  end
end
