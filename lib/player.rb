# Controls the Player and notes the marker

class Player

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def play(game, space)
    game.play(space)
  end
end
