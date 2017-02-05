require 'game'
require 'board'
require 'player'
require 'computer'
require_relative 'helpers/game_helpers'

describe Game do
  let(:player1) { instance_double Player, marker: "X" }
  let(:player2) { instance_double Player, marker: "O" }
  let(:board) { Board.new }
  subject(:game) { described_class.new(player1, player2, board)}

  context "#initialize" do
    it "should take two players and a board" do
      expect(game.player1).to eq player1
    end
  end

  context "setup" do
    it "should allow the player to decide that player one goes first" do
      game.new_game(player1)
      expect(game.current_player).to eq player1
      expect(game.current_opponent).to eq player2
    end

    it "should allow the player to decide that player 2 goes first" do
      game.new_game(player2)
      expect(game.current_player).to eq player2
      expect(game.current_opponent).to eq player1
    end
  end

  context "playing the game" do
    it "should allow the current player to place their move" do
      game.new_game(player1)
      game.play(0)
      expect(game.show_board).to eq ["X",1,2,3,4,5,6,7,8]
    end

    it "should change the current player once a move is made" do
      game.new_game(player1)
      game.play(0)
      expect(game.current_player).to eq player2
    end

    it "should change the current opponent once a move is made" do
      game.new_game(player1)
      game.play(0)
      expect(game.current_opponent).to eq player1
    end

    it "should not change the current player if their move was illegal" do
      game.new_game(player1)
      game.play(10)
      expect(game.current_player).to eq player1
    end

    it "should not allow a move after the game is over" do
      x_wins_two_player
      expect(game.play(0)).to eq "Game Over"
    end

  end

  context "game over" do
    it "knows the game is over if x wins" do
      x_wins_two_player
      expect(game.game_over?).to eq true
    end

    it "knows the game is over if o wins" do
      o_wins_two_player
      expect(game.game_over?).to eq true
    end

    it "knows the game is over if tied" do
      tied_game_two_player
      expect(game.game_over?).to eq true
    end

    it "knows when x wins" do
      x_wins_two_player
      expect(game.winner).to eq player1.marker
    end

    it "knows when o wins" do
      o_wins_two_player
      expect(game.winner).to eq player2.marker
    end

    it "knows that nobody wins a tied game" do
      tied_game_two_player
      expect(game.winner).to eq false
    end

  end

end
