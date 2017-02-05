require 'game'
require 'board'
require 'player'
require 'computer'

describe Game do
  let(:player1) { instance_double Player, marker: "X" }
  let(:player2) { instance_double Player, marker: "O" }
  let(:board) { instance_double Board }
  subject(:game) { described_class.new(player1, player2, board)}

  context "#initialize" do
    it "should take two players and a board" do
      expect(game.player1).to eq player1
    end

    context "setup" do
      it "should allow the player to decide who goes first" do
        game.new_game(player1)
        expect(game.current_player).to eq player1
      end

    end

  end





end
