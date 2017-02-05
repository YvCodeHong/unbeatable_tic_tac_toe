require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

class TicTacToe

  def initialize(board = Board.new)
    @board = board
    @game = nil
    @line = "============================"
  end

  def game_loop
    puts @line
    welcome
    until @game.game_over? do
      take_turn if @player == "Player"
      computer_turn if @opponent == "Computer"
    end
    end_of_game
  end

  private

  def welcome
    puts "Let's play Tic Tac Toe!"
    show_empty_board
    puts "Select 1 for a two player game"
    puts "Select 2 to play against the computer"
    puts "Select 3 for two computers to play against each other"
    select_game_type
  end

  def end_of_game
    @game.update_game_status
    puts @line
    @game.winner ? message = "#{@game.winner} is the winner!" : message = "The game was tied!"
    puts message
    puts @line
  end

  def show_empty_board
    puts "     #{@board.spaces[0]} | #{@board.spaces[1]} | #{@board.spaces[2]}"
    puts "   -------------"
    puts "     #{@board.spaces[3]} | #{@board.spaces[4]} | #{@board.spaces[5]}"
    puts "   -------------"
    puts "     #{@board.spaces[6]} | #{@board.spaces[7]} | #{@board.spaces[8]}"
  end

  def show_board
    puts "     #{@game.board.spaces[0]} | #{@game.board.spaces[1]} | #{@game.board.spaces[2]}"
    puts "   -------------"
    puts "     #{@game.board.spaces[3]} | #{@game.board.spaces[4]} | #{@game.board.spaces[5]}"
    puts "   -------------"
    puts "     #{@game.board.spaces[6]} | #{@game.board.spaces[7]} | #{@game.board.spaces[8]}"
  end

  def select_game_type
    loop do
      game_type = gets.chomp.to_i
      case game_type
      when 1
        puts "Two players? Great choice"
        @player = "Player"
        @opponent = "Player"
        two_player_game
        break
      when 2
        puts "Against the computer? You won't win!"
        @player = "Player"
        @opponent = "Computer"
        player_vs_computer
        break
      when 3
        puts "Watching two computers battle it out? Nice!"
        @player = "Computer"
        @opponent = "Computer"
        computer_vs_computer
        break
      else
        puts "I didn't quite get that - 1, 2 or 3"
      end
    end
  end

  def two_player_game
    @game = Game.new(Player.new("X"), Player.new("O"), @board)
    who_goes_first
  end

  def player_vs_computer
    @game = Game.new(Player.new("X"), Computer.new("O"), @board)
    puts "You are X, the computer is O"
    who_goes_first
  end

  def computer_vs_computer
    @game = Game.new(Computer.new("X"), Computer.new("O"), @board)
    puts "X and O are both computer players"
    who_goes_first
  end

  def who_goes_first
    puts "Who do you want to go first?"
    puts "X or O?"
    loop do
      starting_player = gets.chomp.upcase
      case starting_player
      when "X"
        puts "X goes first!"
        @game.new_game(starting_player)
        break
      when "O"
        puts "O goes first!"
        @game.new_game(starting_player)
        break
      else
        puts "I didn't quite get that - X or O?"
      end
    end
  end

  def take_turn
    print "#{@game.current_player.marker}, which cell are you after?: "
    loop do
      space = gets.chomp.to_i
      if @game.board.illegal_moves(space)
        puts "You can't go there. Try again!"
      else
        @game.play(space)
        show_board
        break
      end
    end
  end

  def computer_turn
    puts "The computer, #{@game.current_player.marker}, is thinking"
    @game.play(@game.current_player.play(@game))
    show_board
  end
end
