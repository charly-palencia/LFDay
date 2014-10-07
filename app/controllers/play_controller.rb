class PlayController < ApplicationController
  before_action :authenticate_user!
  def play
    @player = Player.new.play(current_user.id)
    @player = "Intentalo mas tarde xD" unless @player
  end
end
