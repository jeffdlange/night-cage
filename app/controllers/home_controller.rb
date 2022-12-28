# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @game = setup_params.present? ? Game.new(setup_params) : BlankGame.new
    @discarded = DiscardedTiles.new(game: @game, params: discarded_params)
    @stats = TileStats.new(@game, @discarded)
  end

  private

  def setup_params
    params[:setup]
  end

  def discarded_params
    params[:discarded]
  end
end
