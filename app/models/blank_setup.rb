# frozen_string_literal: true

class BlankSetup
  attr_reader :errors

  def initialize
    %i[
      starting_tiles
      gate_tiles
      straight_tiles
      t_tiles
      four_way_tiles
      key_tiles
      keeper_tiles
      wax_eater_tiles
      pit_fiend_tiles
      pathless_tiles
      omen_tiles
    ].each do |attr|
      instance_variable_set("@#{attr}".to_sym, nil)
      class_eval { attr_reader attr }
    end

    @errors = []
  end

  def ready?
    false
  end
end
