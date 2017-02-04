class Board

  attr_reader :spaces, :winner

  def initialize
    @spaces = [0,1,2,3,4,5,6,7,8]
  end

  def take_turn(space, player)
    return "Illegal move" if illegal_moves(space)
    @spaces[space] = player
  end

  def game_won?(player)
    @winner = player
  end

  def winning_rows
    @spaces.each_slice(3).to_a
  end

  def winning_columns
    winning_rows.transpose
  end

  def winning_diagonals
    [[0,4,7], [2,4,6]]
  end

  def all_winning_possibilities
    winning_rows + winning_columns + winning_diagonals
  end



  private

  def space_taken(space)
    @spaces[space] == ("X" || "O")
  end

  def outside_of_array(space)
    space >= 9 || space < 0
  end

  def illegal_moves(space)
    space_taken(space) || outside_of_array(space)
  end



end
