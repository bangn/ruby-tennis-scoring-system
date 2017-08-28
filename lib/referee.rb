# frozen_string_literal: true

require 'game_helper'

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

    adjust_set_point(@player1, @player2)
  end

  def score
    game_score = GameHelper.calculate_game_score(@player1, @player2)

    return set_score if game_score.nil?

    "#{set_score}, #{game_score}"
  end

  private

  def adjust_game_point(player)
    player.game_point += 1
  end

  def adjust_set_point(player1, player2)
    game_winner = GameHelper.game_winner(player1, player2)

    return unless game_winner

    game_winner.set_point += 1

    GameHelper.reset_game_point(player1)
    GameHelper.reset_game_point(player2)
  end

  def set_score
    "#{@player1.set_point}-#{@player2.set_point}"
  end
end
