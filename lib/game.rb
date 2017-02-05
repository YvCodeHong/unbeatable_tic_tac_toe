# Controls the flow of the game

class Game

  attr_reader :player1, :player2, :board, :current_player, :current_opponent

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def new_game(player)
    player == @player1 ? @current_player = @player1 : @current_player = @player2
    set_opponent
    end

    private
    def set_opponent
      @current_player == @player1 ? @current_opponent = @player2 : @current_opponent = @player1
    end

  end
