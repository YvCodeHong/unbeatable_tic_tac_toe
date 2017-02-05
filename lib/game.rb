# Controls the flow of the game

class Game

attr_reader :player1, :player2, :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

end
