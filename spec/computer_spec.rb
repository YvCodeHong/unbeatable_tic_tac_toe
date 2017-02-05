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
    xit "Can let player 1 start" do
      game.new_game(player1)
      game.play(0)
      game.play(computer.play(game))
      expect(game.show_board).not_to eq ["X",1,2,3,4,5,6,7,9]
    end

    xit "computer can start" do
      game.new_game(computer)
      game.play(computer.play(game))
      game.play(2)
      expect(game.show_board).not_to eq [0,1,"X",3,4,5,6,7,9]
    end
  end

  context "full game feature test move by move - warning SLOW" do
    it "First turn" do
      game.new_game(player1)
      game.play(0)
      game.play(computer.play(game))
      require 'pry'; binding.pry
      expect(game.show_board).to eq ["X",1,2,3,4,5,6,7,9]
    end



  end


end
