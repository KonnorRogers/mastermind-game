require "spec_helper"

module Mastermind
  RSpec.describe ColorHelper do
    context "#attr_reader" do
      it "creates an array" do
        color_helper = ColorHelper::COLORS_ENUM
        expect(color_helper.is_a? Array).to eq(true)
      end

      it "creates an array of size 6" do
        color_helper = ColorHelper::COLORS_ENUM
        expect(color_helper.size).to eq(6)
      end

      it "returns cyan for colors_enum[2]" do
        color_helper = ColorHelper::COLORS_ENUM
        expect(color_helper[2]).to eq(:cyan)
      end
    end
  end
end
