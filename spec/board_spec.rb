require 'board'

describe Board do
  subject(:board) { described_class.new}

  context "The board" do
    it "should initialize with an array numbered 0 - 8" do
      expect(board.spaces).to eq([0,1,2,3,4,5,6,7,8])
    end
  end

  context "When taking a turn it" do
    it "should allow the user to place their marker in any empty space" do
      board.take_turn(0, "X")
      expect(board.spaces).to eq(["X",1,2,3,4,5,6,7,8])
    end

    it "should not allow the user to place their marker somewhere that has been taken" do
      board.take_turn(0, "X")
      expect(board.take_turn(0, "O")).to eq "Illegal move"
    end

    it "should not allow the user to place their marker somewhere that is not in the spaces array" do
      expect(board.take_turn(9, "X")).to eq "Illegal move"
    end

    it "should not allow the user to place their marker in a negative number" do
      expect(board.take_turn(-1, "O")).to eq "Illegal move"
    end
  end
end
