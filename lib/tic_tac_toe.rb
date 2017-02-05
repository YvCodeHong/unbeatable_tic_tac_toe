require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

class TicTacToe

  def initialize(board = Board.new)
    @board = board
  end

  def game_loop
    welcome
  end

  def welcome
    puts "Let's play Tic Tac Toe!"
    show_board
    puts "Select 1 for a two player game"
    puts "Select 2 to play against the computer"
    puts "Select 3 for two computers to play against each other"
  end

  def show_board
    puts "     #{@board.spaces[0]} | #{@board.spaces[1]} | #{@board.spaces[2]}"
    puts "   -------------"
    puts "     #{@board.spaces[3]} | #{@board.spaces[4]} | #{@board.spaces[5]}"
    puts "   -------------"
    puts "     #{@board.spaces[6]} | #{@board.spaces[7]} | #{@board.spaces[8]}"
  end

end
