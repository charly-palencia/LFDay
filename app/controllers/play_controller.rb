class PlayController < ApplicationController
  def play
    @player = Player.play(current_user.id)
  end
end
