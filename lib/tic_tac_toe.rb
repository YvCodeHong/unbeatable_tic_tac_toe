require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'computer'

class TicTacToe

  attr_accessor :game

  def initialize(board = Board.new)
    @board = board
    @game = nil
    @line = "============================"
  end

  def game_loop
    welcome
    select_game_type
    until @game.game_over? do
      player_turn if @player == "Player"
      computer_turn if @opponent == "Computer"
    end
    end_of_game
  end

  def welcome
    puts @line
    puts "Let's play Tic Tac Toe!"
    show_empty_board
    puts "Select 1 for a two player game"
    puts "Select 2 to play against the computer"
    puts "Select 3 for two computers to play against each other"
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
        who_goes_first_prompt
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

  def who_goes_first_prompt
    puts "Who do you want to go first?"
    puts "Select 1 for player"
    puts "Select 2 for computer"
    who_goes_first
  end

  def who_goes_first
    loop do
      starting_player = gets.chomp.to_i
      case starting_player
      when 1
        puts "You go first!"
        player_vs_computer_player_first
        break
      when 2
        puts "The computer goes first!"
        player_vs_computer_computer_first
        break
      else
        puts "I didn't quite get that - 1 or 2?"
      end
    end
  end


  def two_player_game
    @game = Game.new(Player.new("X"), Player.new("O"), @board)
    create_new_game("X")
  end

  def player_vs_computer_player_first
    @game = Game.new(Player.new("X"), Computer.new("O"), @board)
    puts "You are X, the computer is O"
    create_new_game("X")
  end

  def player_vs_computer_computer_first
    @game = Game.new(Computer.new("X"), Player.new("O"), @board)
    puts "The computer is X, you are O"
    create_new_game("X")
    computer_turn
  end

  def computer_vs_computer
    @game = Game.new(Computer.new("X"), Computer.new("O"), @board)
    puts "X and O are both computer players"
    create_new_game("X")
  end

  def create_new_game(starting_player_marker)
    @game.new_game(starting_player_marker)
  end

  def player_turn
    player_turn_output
    loop do
      space = gets.chomp
      if input_is_an_integer?(space)
        space = space.to_i
        if @game.board.illegal_moves(space)
          puts "You can't go there. Try again!"
        else
          @game.play(space)
          show_board
          break
        end
      else
        puts "Not a number. Try again!"
      end
    end
  end

  def input_is_an_integer?(input)
    /\A[+-]?\d+\z/ === input
  end

  def player_turn_output
    print "#{@game.current_player.marker}, which cell are you after?: "
  end

  def computer_turn
    computer_turn_output
    @game.play(@game.current_player.play(@game))
    show_board
  end

  def computer_turn_output
    puts "The computer, #{@game.current_player.marker}, is thinking"
  end
end
