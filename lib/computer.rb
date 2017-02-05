# Controls the AI

class Computer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def calculate_best_move(game, depth=0, best_possible_score={})
    return 0 if game.tied?
    return -1 if game.game_over?

    game.board.all_available_spaces.each do |space|
      game.board.check_space(space)
      best_possible_score[space] = -1 * calculate_best_move(game, depth + 1, {})
      game.board.reset_space(space)
    end

    best_move = best_possible_score.max_by { |k, v| v }[0]
    top_minimax_score = best_possible_score.max_by { |k, v| v }[1]

    if depth == 0
      return best_move
    elsif depth > 0
      return top_minimax_score
    end
  end

end
