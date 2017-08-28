# frozen_string_literal: true

require 'game_point_calculator'

class Referee
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def point_won_by(player_name)
    case player_name
    when @player1.name
      adjust_game_point(@player1)
    when @player2.name
      adjust_game_point(@player2)
    end
  end

  def score
    game_point = GamePointCalculator.game_point(@player1, @player2)

    return set_point if game_point.nil?

    "#{set_point}, #{game_point}"
  end

  private

  def adjust_game_point(player)
    player.game_point += 1
  end

  def set_point
    "#{@player1.set_point}-#{@player2.set_point}"
  end
end
