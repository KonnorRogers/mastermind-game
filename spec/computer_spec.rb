require "spec_helper"

module Mastermind
  RSpec.describe Computer do
    context "#initialize" do
      it "sets @computer to computer" do
        computer = Computer.new
        expect(computer.computer).to eq "computer"
      end

      it "sets @color_helper to ColorHelper colors_enum" do
        computer = Computer.new
        expect(computer.color_helper).to eq(ColorHelper::COLORS_ENUM)
      end
    end

    context "#select_random_colors" do
      it "all 4 colors match to 1 of 6 colors in colors_enum" do
        computer = Computer.new
        colors_enum = computer.color_helper
        colors = computer.select_random_colors

        expect( colors.all? { |color| colors_enum.include?(color) } ).to eq true
      end

      it "has a size of 4" do
        computer = Computer.new
        colors = computer.select_random_colors
        expect(colors.size).to eq 4
      end
    end

    context "#print_random_colors" do
      it "returns a string of 'blue, blue, cyan, red'" do
        computer = Computer.new
        allow(computer).to receive(:select_random_colors) { [:blue, :blue, :cyan, :red] }
        expect(computer.print_random_colors).to eq("blue, blue, cyan, red")
      end
    end
  end
end
