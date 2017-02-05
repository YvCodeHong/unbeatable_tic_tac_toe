# Controls the AI

require_relative 'board'

class Computer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def calculate_best_move(game, depth=0, best_possible_score={})
    return 0 if game.game_tied?
    return -1 if game.game_over?

    game.board.all_available_spaces.each do |space|
      check_space(game, space)
      best_possible_score[space] = -1 * calculate_best_move(game, depth + 1, {})
      reset_space(game, space)
    end

    best_space_to_pick = best_possible_score.max_by { |k, v| v }[0]
    top_minimax_score = best_possible_score.max_by { |k, v| v }[1]

    if depth == 0
      require 'pry'; binding.pry
      return best_space_to_pick
    elsif depth > 0
      return top_minimax_score
    end

  end

  def check_space(game, space)
    game.board.select_space(space, game.current_player.marker)
  end

  def reset_space(space)
    game.board.reset_space(game, space)
  end

  def play(game)
    calculate_best_move(game)
  end

end
