# frozen_string_literal: true

require 'game_service'

class Referee
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @game_service = GameService.new(player1, player2)
  end

  def point_won_by(player_name)
    case player_name
    when @player1.name
      @game_service.adjust_game_point(@player1)
    when @player2.name
      @game_service.adjust_game_point(@player2)
    end

    adjust_set_point(@player1, @player2)
  end

  def score
    game_score = @game_service.calculate_game_score

    return set_score if game_score.nil?

    "#{set_score}, #{game_score}"
  end

  private

  def adjust_set_point(player1, player2)
    game_winner = @game_service.game_winner

    return unless game_winner

    game_winner.set_point += 1

    @game_service.reset_game_point(player1)
    @game_service.reset_game_point(player2)
  end

  def set_score
    "#{@player1.set_point}-#{@player2.set_point}"
  end
end
