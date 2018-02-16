require "spec_helper"

module Mastermind
  RSpec.describe Game do
    context "#initialize" do
      it "creates a board" do
        game = Game.new
        expect(game.board.is_a Board).to eq(true)
      end
    end
  end
end
