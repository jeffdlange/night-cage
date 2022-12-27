# frozen_string_literal: true

class GameProgress
  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}".to_sym, value.to_i)
      class_eval { attr_reader key.to_sym }
    end
  end

  private

end
