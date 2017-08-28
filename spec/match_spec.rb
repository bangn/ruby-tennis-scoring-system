# frozen_string_literal: true

require 'match'

describe Match do
  let(:match) { Match.new('Nadal', 'Federer') }

  context 'is not a tie break' do
    context 'no player has win a point' do
      it 'returns initial score of the match' do
        expect(match.score).to eq('0-0')
      end
    end

    context 'Nadal win a point' do
      before do
        match.point_won_by('Nadal')
      end

      it 'returns 15 for Nadal' do
        expect(match.score).to eq('0-0, 15-0')
      end
    end
  end
end
