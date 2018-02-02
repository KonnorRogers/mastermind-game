require "spec_helper.rb"

module Mastermind
  RSpec.describe Cell do
    context "#initialize" do
      it "sets the value to O when initialized" do
        cell = Cell.new
        expect(cell.value).to eq("O")
      end

      it "sets the value to :blue when given value blue" do
        cell = Cell.new
        cell.value = :blue
        expect(cell.value).to eq(:blue)
      end
    end
  end
end
