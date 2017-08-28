# frozen_string_literal: true

require 'player'
require 'referee'

RSpec.describe Referee do
  context 'not a tie-break game' do
    let(:nadal) { Player.new('Nadal', 0, 0) }
    let(:federer) { Player.new('Federer', 0, 0) }
    let(:referee) { Referee.new(nadal, federer) }

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

    context 'Federer wins a game' do
      it 'resets game point and increase set point for Federer' do
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        expect(referee.score).to eq('0-1')
      end
    end

    context 'game is deuce' do
      it 'returns set score and deuce' do
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        referee.point_won_by('Federer')
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('0-0, Deuce')
      end
    end

    context 'game is advantage for Nadal' do
      it 'returns set score and advantage for Nadal' do
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        referee.point_won_by('Nadal')

        expect(referee.score).to eq('0-0, Advantage Nadal')
      end
    end
  end

  context 'tie-break game' do
    let(:nadal) { Player.new('Nadal', 6, 0) }
    let(:federer) { Player.new('Federer', 6, 0) }
    let(:referee) { Referee.new(nadal, federer) }

    context 'no player has win a point' do
      it 'returns initial score of the match' do
        expect(referee.score).to eq('6-6')
      end
    end

    context 'Nadal wins a point' do
      it 'returns 1 for Nadal' do
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('6-6, 1-0')
      end
    end

    context 'Nadal wins 3 points' do
      it 'returns 15 for Nadal' do
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('6-6, 3-0')
      end
    end

    context 'Nadal wins a game' do
      it 'resets game point and increase set point for Nadal' do
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        expect(referee.score).to eq('7-6')
      end
    end

    context 'Federer wins a game' do
      it 'resets game point and increase set point for Federer' do
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        expect(referee.score).to eq('6-7')
      end
    end

    context 'both player win 6 points' do
      it 'resets game point and increase set point for Federer' do
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')
        referee.point_won_by('Nadal')

        referee.point_won_by('Federer')
        referee.point_won_by('Federer')
        referee.point_won_by('Federer')

        referee.point_won_by('Nadal')

        expect(referee.score).to eq('6-6, 6-6')
      end
    end
  end
end
