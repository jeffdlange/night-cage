# frozen_string_literal: true

class TileStats
  def initialize(setup, drawn)
    @setup = setup
    @drawn = drawn
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
    total_tiles - (drawn_safe_tiles + drawn_monster_tiles)
  end

  def safe_tiles
    path_tiles + @setup.key_tiles + @setup.gate_tiles
  end

  def safe_tiles_left
    safe_tiles - drawn_safe_tiles
  end

  def path_tiles
    @setup.starting_tiles + @setup.straight_tiles + @setup.t_tiles + @setup.four_way_tiles
  end

  def path_tiles_left
    path_tiles - drawn_path_tiles
  end

  def monster_tiles
    @setup.keeper_tiles + @setup.wax_eater_tiles + @setup.pit_fiend_tiles +
      @setup.pathless_tiles + @setup.omen_tiles
  end

  def monster_tiles_left
    monster_tiles - drawn_monster_tiles
  end

  def gate_tiles_left
    @setup.gate_tiles - @drawn.gate_tiles
  end

  def key_tiles_left
    key_method = @setup.key_tiles.positive? ? :key_tiles : :keeper_tiles

    @setup.send(key_method) - @drawn.send(key_method)
  end

  def drawn_safe_tiles
    drawn_path_tiles + @drawn.key_tiles + @drawn.gate_tiles
  end

  def drawn_path_tiles
    @drawn.starting_tiles + @drawn.straight_tiles + @drawn.t_tiles +
      @drawn.four_way_tiles
  end

  def drawn_monster_tiles
    @drawn.keeper_tiles + @drawn.wax_eater_tiles +
      @drawn.pit_fiend_tiles + @drawn.pathless_tiles  + @drawn.omen_tiles
  end
end
