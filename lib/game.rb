# Controls the flow of the game

class Game

  attr_reader :player1, :player2, :board, :current_player, :current_opponent

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def new_game(player)
    if player == @player1
      @current_player = @player1
      @current_opponent = @player2
    else
      @current_player = @player2
      @current_opponent = @player1
    end
  end

end
