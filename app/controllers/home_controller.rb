# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @setup = setup_params.present? ? GameSetup.new(setup_params) : BlankSetup.new
    @drawn = DrawnTiles.new(setup: @setup, params: drawn_params)
    @stats = TileStats.new(@setup, @drawn)
  end

  private

  def setup_params
    params[:setup]
  end

  def drawn_params
    params[:drawn]
  end
end
