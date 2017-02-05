require 'computer'

describe Computer do
  subject(:computer) { described_class.new("O")}
  let(:player1) { instance_double Player, marker: "X" }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, computer, board)}


  context "#initialize" do
    it "should take a marker when initialized" do
      expect(computer.marker).to eq "O"
    end
  end

  context "feature testing" do
    it "returns a space when called - 1st turn" do
      game.new_game(player1)
      game.play(0)
      game.play(computer.play(game))
      expect(game.show_board).not_to eq ["X",1,2,3,4,5,6,7,9]
    end

    it "returns a space when called - 2nd turn" do
      game.new_game(computer)
      game.play(computer.play(game))
      game.play(2)
      expect(game.show_board).to eq [0,1,2,3,4,5,6,7,9]
    end


  end


end
