require 'computer'

describe Computer do
  subject(:computer) { described_class.new("O")}

  context "#initialize" do
    it "should take a marker when initialized" do
      expect(computer.marker).to eq "O"
    end
  end
end
