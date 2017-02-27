# Controls the Player and notes the marker

class Player

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def play(game)
    game.play(game.board.all_available_spaces.sample)
  end
end
