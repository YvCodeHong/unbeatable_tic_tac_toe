# Determines the winner by storing the moves

class Board

  attr_reader :spaces, :winner, :game_over, :move_count, :current_player, :current_opponent

  def initialize
    @spaces = [0,1,2,3,4,5,6,7,8]
    @winner = false
    @game_over = false
    @move_count = 0
  end

  def take_turn(space, player)
    return "Illegal move" if illegal_moves(space)
    select_space(space, player)
    @move_count += 1
    game_over?
  end

  def select_space(space, player)
    @spaces[space] = player
  end

  def winning_rows
    @spaces.each_slice(3).to_a
  end

  def winning_columns
    winning_rows.transpose
  end

  def winning_diagonals
    [
      [ @spaces[0], @spaces[4] ,@spaces[7] ],
      [ @spaces[2], @spaces[4], @spaces[6] ]
    ]
  end

  def all_winning_possibilities
    winning_rows + winning_columns + winning_diagonals
  end

  def game_won?(player)
    if check_game(player) != []
      set_winner(player)
      set_game_over
    end
  end

  def tied?
    (1..8).to_a.all? do |space|
      @spaces[space] != space
    end
  end

  def show_board
    @spaces
  end

  def game_over?
    game_won?("X")
    game_won?("O")
    @game_over = true if @move_count > 8
  end

  def all_available_spaces
    @spaces.select { |space| (!space_taken(space)) }
  end

  def reset_space(space)
    @spaces[space] = space
  end

  private
  def space_taken(space)
    space == "X" || space == "O"
  end

  def outside_of_array(space)
    space >= 9 || space < 0
  end

  def illegal_moves(space)
    space_taken(@spaces[space]) || outside_of_array(space)
  end

  def set_winner(player)
    @winner = player
  end

  def set_game_over
    @game_over = true
  end

  def check_game(player)
    all_winning_possibilities.select do |possibility|
      possibility == [player, player, player]
    end
  end



end
