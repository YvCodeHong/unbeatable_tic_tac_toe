require 'tic_tac_toe'
require 'stringio'

describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }
  let(:player1) { Player.new("X") }
  let(:player2) { Player.new("O") }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, player2, board)}

  context "#welcome" do
    it "should output a welcome when the game is run" do
      expected_output = "============================\nLet's play Tic Tac Toe!\n     0 | 1 | 2\n   -------------\n     3 | 4 | 5\n   -------------\n     6 | 7 | 8\nSelect 1 for a two player game\nSelect 2 to play against the computer\nSelect 3 for two computers to play against each other\n"
      expect { tic_tac_toe.welcome }.to output(expected_output).to_stdout
    end
  end

  context "#select_game_type" do
    it "invalid number" do
      allow(tic_tac_toe).to receive(:gets).and_return('42')
      allow(tic_tac_toe).to receive(:loop).and_yield
      expect { tic_tac_toe.select_game_type }.to output("I didn't quite get that - 1, 2 or 3\n").to_stdout
    end

    it "1 - Two players" do
      allow(tic_tac_toe).to receive(:gets).and_return('1')
      allow(tic_tac_toe).to receive(:two_player_game)
      expect { tic_tac_toe.select_game_type }.to output("Two players? Great choice\n").to_stdout
    end

    it "2 - Player vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('2')
      allow(tic_tac_toe).to receive(:player_vs_computer)
      expect { tic_tac_toe.select_game_type }.to output("Against the computer? You won't win!\n").to_stdout
    end

    it "3 - Computer vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('3')
      allow(tic_tac_toe).to receive(:computer_vs_computer)
      expect { tic_tac_toe.select_game_type }.to output("Watching two computers battle it out? Nice!\n").to_stdout
    end
  end

  context "#two_player_game" do
    it "creates a game with two player objects" do
      allow(tic_tac_toe).to receive(:who_goes_first)
      tic_tac_toe.two_player_game
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Player)
    end
  end

  context "#player_vs_computer" do
    it "creates a game with two player objects" do
      allow(tic_tac_toe).to receive(:who_goes_first)
      tic_tac_toe.player_vs_computer
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

  context "#computer_vs_computer" do
    it "creates a game with two player objects" do
      allow(tic_tac_toe).to receive(:who_goes_first)
      tic_tac_toe.computer_vs_computer
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Computer)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

end
