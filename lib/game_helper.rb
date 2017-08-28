# frozen_string_literal: true

class GameHelper
  GAME_POINT_MAPPER = {
    0 => '0',
    1 => '15',
    2 => '30',
    3 => '40'
  }

  class << self
    def calculate_game_score(player1, player2)
      return nil if new_game?(player1, player2)

      "#{GAME_POINT_MAPPER.fetch(player1.game_point)}-#{GAME_POINT_MAPPER.fetch(player2.game_point)}"
    end

    def game_winner(player1, player2)
      return nil unless reach_game_point?(player1, player2)

      return player1 if (player1.game_point - player2.game_point >= 2)

      return player2 if (player2.game_point - player1.game_point >= 2)
    end

    def reach_game_point?(player1, player2)
      player1.game_point > 3 || player2.game_point > 3
    end

    def reset_game_point(player)
      player.game_point = 0
    end

    private

    def new_game?(player1, player2)
      player1.game_point.zero? && player2.game_point.zero?
    end
  end
end
