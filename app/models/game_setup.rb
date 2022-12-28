# frozen_string_literal: true

class GameSetup
  attr_reader :errors

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}".to_sym, value.to_i)
      class_eval { attr_reader key.to_sym }
    end

    @errors = []
    run_validations unless params.blank?
  end

  def ready?
    valid? && starting_tiles.present?
  end

  def to_h
    instance_variables.each_with_object({}) do |ivar, hash|
      next if ivar == :@errors

      key = ivar.to_s.delete_prefix('@').to_sym
      hash[key] = instance_variable_get(ivar)
    end
  end

  private

  def run_validations
    starting_tiles_count
    keys_vs_keepers
    key_count
  end

  def starting_tiles_count
    return if starting_tiles.in? [4, 5]

    @errors << 'You must have 4 or 5 starting tiles.'
  end

  def keys_vs_keepers
    return unless key_tiles.positive? && keeper_tiles.positive?

    @errors << 'You must play with EITHER keys OR keepers, not both.'
  end

  def key_count
    return unless (key_tiles.positive? && key_tiles < 4) || (keeper_tiles.positive? && keeper_tiles < 4)

    @errors << 'You need at least 4 keys/keepers'
  end

  def valid?
    @errors.empty?
  end
end
