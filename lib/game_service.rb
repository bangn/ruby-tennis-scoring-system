# frozen_string_literal: true

class GameService
  GAME_POINT_MAPPER = {
    0 => '0',
    1 => '15',
    2 => '30',
    3 => '40'
  }

  GAME_POINT = 3
  TIE_BREAK_GAME_POINT = 6

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def calculate_game_score
    return nil if new_game?

    return "#{@player1.game_point}-#{@player2.game_point}" if tie_break?

    return 'Deuce' if game_deuce?

    advantage_player = game_advantage
    return "Advantage #{advantage_player.name}" unless advantage_player.nil?

    "#{GAME_POINT_MAPPER.fetch(@player1.game_point)}-#{GAME_POINT_MAPPER.fetch(@player2.game_point)}"
  end

  def game_winner
    return nil unless reach_game_point?

    return @player1 if (@player1.game_point - @player2.game_point >= 2)

    return @player2 if (@player2.game_point - @player1.game_point >= 2)
  end

  def reach_game_point?
    return @player1.game_point > GAME_POINT || @player2.game_point > GAME_POINT unless tie_break?

    @player1.game_point >= TIE_BREAK_GAME_POINT || @player2.game_point >= TIE_BREAK_GAME_POINT
  end

  def reset_game_point(player)
    player.game_point = 0
  end

  def game_deuce?
    (@player1.game_point == @player2.game_point) && (@player1.game_point >= GAME_POINT)
  end

  def adjust_game_point(player)
    player.game_point += 1
  end

  def game_advantage
    return nil unless reach_game_point?

    return @player1 if (@player1.game_point - @player2.game_point == 1)

    return @player2 if (@player2.game_point - @player1.game_point == 1)
  end

  private

  def new_game?
    @player1.game_point.zero? && @player2.game_point.zero?
  end

  def tie_break?
    (@player1.set_point == TIE_BREAK_GAME_POINT) && (@player2.set_point == TIE_BREAK_GAME_POINT)
  end
end
