# frozen_string_literal: true

class Player
  def initialize(name, set_point, game_point)
    @name = name
    @set_point = set_point
    @game_point = game_point
  end

  attr_accessor :name, :set_point, :game_point
end
