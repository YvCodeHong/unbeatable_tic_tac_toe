class Board

  attr_reader :spaces

  def initialize
    @spaces = [0,1,2,3,4,5,6,7,8]
  end

  def take_turn(space, player)
    return "Illegal move" if space_taken(space)
    @spaces[space] = player
  end


private

def space_taken(space)
  @spaces[space] == ("X" || "O")
end

end
