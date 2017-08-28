# frozen_string_literal: true

require 'forwardable'

require 'referee'
require 'player'

class Match
  extend Forwardable

  def_delegator :@referee, :point_won_by
  def_delegator :@referee, :score

  def initialize(player1, player2)
    @player1 = Player.new(player1, 0, 0)
    @player2 = Player.new(player2, 0, 0)
    @referee = Referee.new(@player1, @player2)
  end
end
