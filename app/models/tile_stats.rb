# frozen_string_literal: true

class TileStats
  def initialize(game, discarded)
    @game = game
    @discarded = discarded
  end

  def to_h
    {
      safe_tiles: safe_tiles,
      safe_tiles_left: safe_tiles_left,
      monster_tiles: monster_tiles,
      monster_tiles_left: monster_tiles_left,
      total_tiles: total,
      total_tiles_left: total_left
    }
  end

  def total_tiles
    safe_tiles + monster_tiles
  end

  def total_tiles_left
    total_tiles - (discarded_safe_tiles + discarded_monster_tiles)
  end

  def safe_tiles
    path_tiles + @game.key_tiles + @game.gate_tiles
  end

  def safe_tiles_left
    safe_tiles - discarded_safe_tiles
  end

  def path_tiles
    @game.starting_tiles + @game.straight_tiles + @game.t_tiles + @game.four_way_tiles
  end

  def path_tiles_left
    path_tiles - discarded_path_tiles
  end

  def monster_tiles
    @game.keeper_tiles + @game.wax_eater_tiles + @game.pit_fiend_tiles +
      @game.pathless_tiles + @game.omen_tiles
  end

  def monster_tiles_left
    monster_tiles - discarded_monster_tiles
  end

  def discarded_safe_tiles
    discarded_path_tiles + @discarded.key_tiles + @discarded.gate_tiles
  end

  def discarded_path_tiles
    @discarded.starting_tiles + @discarded.straight_tiles + @discarded.t_tiles +
      @discarded.four_way_tiles
  end

  def discarded_monster_tiles
    @discarded.keeper_tiles + @discarded.wax_eater_tiles +
      @discarded.pit_fiend_tiles + @discarded.pathless_tiles  + @discarded.omen_tiles
  end
end
