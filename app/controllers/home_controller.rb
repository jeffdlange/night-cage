# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @game = game_params.present? ? Game.new(game_params) : BlankGame.new
  end

  private

  def game_params
    params[:game]
  end
end
