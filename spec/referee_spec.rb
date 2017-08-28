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

    context 'Nadal wins a point' do
      it 'returns 15 for Nadal' do
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('0-0, 15-0')
      end
    end

    context 'Nadal wins 3 points' do
      it 'returns 40 for Nadal' do
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('0-0, 40-0')
      end
    end

    context 'Nadal wins a game' do
      it 'resets game point and increase set point for Nadal' do
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('1-0')
      end
    end
  end
end
