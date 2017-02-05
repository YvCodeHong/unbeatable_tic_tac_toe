# Controls the flow of the game

class Game

  attr_reader :player1, :player2, :board, :current_player, :current_opponent, :winner

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = false
  end

  def new_game(player)
    player == @player1 ? @current_player = @player1 : @current_player = @player2
    set_opponent
  end

  def play(space)
    return "Game Over" if game_over?
    change_turns if check_space(space)
    game_over?
    set_winner
  end

  def check_space(space)
    @board.take_turn(space, @current_player.marker) != "Illegal move"
  end

  def show_board
    @board.show_board
  end

  def game_over?
    @board.game_over?
  end

  def game_tied?
    @board.tied?
  end

  private
  def set_opponent
    @current_player == @player1 ? @current_opponent = @player2 : @current_opponent = @player1
  end

  def change_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    set_opponent
  end

  def set_winner
    @winner = @board.winner
  end


end
