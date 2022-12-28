# frozen_string_literal: true

class DiscardedTiles
  DEFAULTS = {
    starting_tiles: 0,
    gate_tiles: 0,
    straight_tiles: 0,
    t_tiles: 0,
    four_way_tiles: 0,
    key_tiles: 0,
    keeper_tiles: 0,
    wax_eater_tiles: 0,
    pit_fiend_tiles: 0,
    pathless_tiles: 0,
    omen_tiles: 0
  }.freeze

  def initialize(game:, params:)
    @game = game
    @params = params.present? ? params : DEFAULTS

    @params.each do |key, value|
      instance_variable_set("@#{key}".to_sym, value.to_i)
      class_eval { attr_reader key.to_sym }
    end
  end

  def gameover?
    keys_lost? || gates_lost?
  end

  def gameover_reason
    keys_lost? ? 'keys' : 'gates'
  end

  private

  def gates_lost?
    (@game.gate_tiles - gate_tiles).zero?
  end

  def keys_lost?
    if key_game?
      (@game.key_tiles - key_tiles).zero?
    elsif keeper_game?
      (@game.keeper_tiles - keeper_tiles).zero?
    end
  end

  def key_game?
    @game.key_tiles.positive?
  end

  def keeper_game?
    @game.keeper_tiles.positive?
  end
end
