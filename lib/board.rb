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
    all_winning_possibilities.any?  do |possibility|
       possibility.count(player) == 3
       @winner = player
     end
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

  def set_winner(player)
    @winner = player
  end



end
