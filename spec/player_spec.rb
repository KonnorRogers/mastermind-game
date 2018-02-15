require "spec_helper"

module Mastermind
  RSpec.describe Player do
    context "#initialize" do
      it "returns an error when initialized w/o input" do
          expect{ Player.new({}) }.to raise_error(KeyError)
      end

      it "does not raise an error when initialized w/ proper input" do
        input = { name: "Konnor", guesser: false }
        expect{ Player.new(input) }.to_not raise_error
      end
    end

    context "#name" do
      it "returns 'Konnor' when given konnor as input" do
        player = Player.new( {name: "Konnor", guesser: true} )
        expect(player.name).to eq("Konnor")
      end
    end

    context "#guesser" do
      it "returns true, when guesser = true as input" do
        input = { name: "Konnor", guesser: true}
        expect(Player.new(input).guesser).to eq true
      end
    end
  end
end
