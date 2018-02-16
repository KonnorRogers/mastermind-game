module Mastermind
  class Player
    attr_reader :name
    attr_accessor :guesser, :master_answer

    def initialize(input)
      @name = input.fetch(:name)
      @guesser = input.fetch(:guesser)
    end

    def master_input_prompt
      "Input 4 colors to create your master answer\nI.E. blue, blue, red, orange"
    end

    def get_master_answer(input)
      colors_key = ColorHelper::COLORS_ENUM

      sanitized_input = input.split(", ").map { |color| color.to_sym }
      if (sanitized_input.all? { |color| colors_key.include?(color) })
        @master_answer = sanitized_input
      else
        puts "Improper input given, please provide answers in the format blue, blue, orange, red"
        "Improper input"
      end
    end
  end
end
