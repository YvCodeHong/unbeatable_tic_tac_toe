require 'player'

describe Player do
  subject(:player1) { described_class.new("X")}
  let(:player2) { instance_double Player, marker: "O" }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, player2, board)}

  context "#initialize" do
    it "should take a marker when initialized" do
      expect(player1.marker).to eq "X"
    end

    context "#play" do
      it "has the ability to play the game" do
        expect(player1).to respond_to(:play).with(2).arguments
      end
    end
  end
end
