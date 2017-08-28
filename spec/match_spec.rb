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
      it 'returns 15 for Nadal' do
        match.point_won_by('Nadal')

        expect(match.score).to eq('0-0, 15-0')
      end
    end

    context 'example' do
      it 'returns correct score' do
        match.point_won_by('Nadal')
        match.point_won_by('Federer')
        expect(match.score).to eq('0-0, 15-15')

        match.point_won_by('Nadal')
        match.point_won_by('Nadal')
        expect(match.score).to eq('0-0, 40-15')

        match.point_won_by('Federer')
        match.point_won_by('Federer')
        expect(match.score).to eq('0-0, Deuce')

        match.point_won_by('Nadal')
        expect(match.score).to eq('0-0, Advantage Nadal')

        match.point_won_by('Nadal')
        expect(match.score).to eq('1-0')
      end
    end
  end
end
