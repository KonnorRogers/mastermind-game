require "spec_helper"

module Mastermind
  RSpec.describe Game do
    context "#initialize" do
      it "@board" do
        game = Game.new
        expect(game.board.is_a? Board).to eq(true)
      end

      it "@computer" do
        game = Game.new
        expect(game.computer.is_a? Computer).to eq (true)
      end

      it "@player" do
        game = Game.new
        expect(game.player.guesser).to eq (true)
      end

      it "@guesses" do
        game = Game.new
        expect(game.guesses).to eq 0
      end

      it "@color_helper" do
        game = Game.new
        expect(game.color_helper.is_a? ColorHelper).to eq true
      end
    end

    context "#play" do

    end

    context "#game_over?" do
      it "true if winner is true" do
        game = Game.new
        allow(game).to receive(:winner?) { true }

        expect(game.game_over?).to eq true
      end

      it "true if player is winner" do
        game = Game.new
        allow(game.player).to receive(:winner?) { true }

        expect(game.game_over?).to eq true
      end

      it "true if computer is winner" do
        game = Game.new
        allow(game.computer).to receive(:winner?) { true }

        expect(game.game_over?).to eq true
      end

      it "false if no one has been set to true" do
        game = Game.new
        expect(game.game_over?).to eq false
      end
    end

    context "#winner?" do
      it "returns true if player is a winner" do
        game = Game.new
        game.player.winner = true
        expect(game.game_over?).to eq true
      end

      it "returns true if computer is a winner" do
        game = Game.new
        game.computer.winner = true
        expect(game.game_over?).to eq true
      end

      it "returns false if nothing given" do
        game = Game.new
        expect(game.game_over?).to eq false
      end
    end
  end
end
