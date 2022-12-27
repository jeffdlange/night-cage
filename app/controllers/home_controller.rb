class HomeController < ApplicationController
  def index
    @game_started = params[:starting_tiles].present?
  end
end
