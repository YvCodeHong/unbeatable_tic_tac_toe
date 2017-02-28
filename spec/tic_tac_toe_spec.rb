require 'tic_tac_toe'
require 'stringio'

describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }
  let(:player1) { instance_double Player, marker: "X" }
  let(:player2) { instance_double Player, marker: "O" }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, player2, board)}

  context "#welcome" do
    it "should output a welcome when the game is run" do
      expect { tic_tac_toe.welcome }.to output("============================\nLet's play Tic Tac Toe!\n     0 | 1 | 2\n   -------------\n     3 | 4 | 5\n   -------------\n     6 | 7 | 8\nSelect 1 for a two player game\nSelect 2 to play against the computer\nSelect 3 for two computers to play against each other\n").to_stdout
    end
  end
end
