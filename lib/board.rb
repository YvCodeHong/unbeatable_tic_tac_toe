class Board

  attr_reader :spaces

  def initialize
    @spaces = [0,1,2,3,4,5,6,7,8]
  end

  def take_turn(space, player)
    return "Illegal move" if illegal_moves(space)
    @spaces[space] = player
  end


private

def space_taken(space)
  @spaces[space] == ("X" || "O")
end

def outside_of_array(space)
  space >= 9
end

def illegal_moves(space)
  space_taken(space) || outside_of_array(space)
end

end
