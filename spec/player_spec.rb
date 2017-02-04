require 'player'

describe Player do
  subject(:player1) { described_class.new("X")}

  context "#initialize" do
    it "should take a marker when the object is initialized" do
      expect(player1.marker).to eq "X"
    end
  end
end
