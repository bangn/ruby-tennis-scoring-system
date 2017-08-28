# frozen_string_literal: true

require 'referee'
require 'player'

class Match
  def initialize(player1, player2)
    @player1 = Player.new(player1, 0, 0)
    @player2 = Player.new(player2, 0, 0)
    @referee = Referee.new(@player1, @player2)
  end

  def point_won_by(player)
    @referee.point_won_by(player)
  end

  def score
    @referee.score
  end
end
