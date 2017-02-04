require 'board'

describe Board do
  subject(:board) { described_class.new}

  context "#initialize" do
    it "should initialize with an array numbered 0 - 8" do
      expect(board.spaces).to eq([0,1,2,3,4,5,6,7,8])
    end
  end
end
