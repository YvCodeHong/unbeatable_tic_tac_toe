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
      take_turn
      show_board
      computer_turn if @opponent == "Computer"
    end
    @game.update_game_status
    puts @line
    if @game.winner
      puts "#{@game.winner} is the winner!"
    else
      puts "The game was tied!"
    end
    puts @line
  end

  def welcome
    puts "Let's play Tic Tac Toe!"
    show_empty_board
    puts "Select 1 for a two player game"
    puts "Select 2 to play against the computer"
    puts "Select 3 for two computers to play against each other"
    select_game_type
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
        @opponent = "Player"
        two_player_game
        break
      when 2
        puts "Against the computer? You won't win!"
        @opponent = "Computer"
        player_vs_computer
        break
      when 3
        puts "Watching two computers battle it out? Nice!"
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
    who_goes_first_with_computer
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

  def who_goes_first_with_computer
    puts "Who do you want to go first?"
    puts "X(You!) or O(computer)?"
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
        computer_turn
        break
      else
        puts "I didn't quite get that - X or O?"
      end
    end
  end

  def take_turn
    print "#{@game.current_player.marker}, which cell are you after?: "
    space = gets.chomp.to_i
    @game.play(space)
  end

  def computer_turn
    puts "The computer, #{@game.current_player.marker} is thinking"
    @game.play(@game.player2.play(@game))
    show_board
  end
end
