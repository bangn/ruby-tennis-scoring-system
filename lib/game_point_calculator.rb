# frozen_string_literal: true

class GamePointCalculator
  GAME_POINT_MAPPER = {
    0 => '0',
    1 => '15',
    2 => '30',
    3 => '40'
  }

  class << self
    def game_point(player1, player2)
      return nil if new_game?(player1, player2)

      "#{GAME_POINT_MAPPER.fetch(player1.game_point)}-#{GAME_POINT_MAPPER.fetch(player2.game_point)}"
    end

    private

    def new_game?(player1, player2)
      player1.game_point.zero? && player2.game_point.zero?
    end
  end
end
