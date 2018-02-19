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
        player = Player.new( {name: "Konnor", guesser: true } )
        expect(player.name).to eq("Konnor")
      end
    end

    context "#guesser" do
      it "returns true, when guesser = true as input" do
        input = { name: "Konnor", guesser: true }
        expect(Player.new(input).guesser).to eq true
      end

      it "returns false when guesser = false" do
        input = { name: "Konnor", guesser: false }
        expect(Player.new(input).guesser).to eq false
      end
    end

    context "#get_master_answer" do
      it "sets the master answer to blue, red, orange, blue w/ proper input" do

        player = Player.new({ name: "Konnor", guesser: false })
        input = "blue, blue, red, red"
        expect(player.get_master_answer(input)).to eq([:blue, :blue, :red, :red])
      end

      it "returns Improper input w/ improper input" do
        player = Player.new({ name: "konnor", guesser: false})

        input = "lol, hi, boo"
        expect(player.get_master_answer(input)).to eq("Improper input")
      end
    end
  end
end
