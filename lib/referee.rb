# frozen_string_literal: true

class Referee
  GAME_POINT_MAPPER = {
    0 => '0',
    1 => '15',
    2 => '30',
    3 => '40'
  }

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

  def game_point
    return nil if new_game?

    "#{GAME_POINT_MAPPER.fetch(@player1.game_point)}-#{GAME_POINT_MAPPER.fetch(@player2.game_point)}"
  end

  def new_game?
    @player1.game_point.zero? && @player2.game_point.zero?
  end
end
