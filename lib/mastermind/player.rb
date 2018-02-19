module Mastermind
  class Player
    attr_accessor :guesser, :master_answer, :name, :winner

    def initialize(input)
      @name = input.fetch(:name)
      @guesser = input.fetch(:guesser)
      @winner = false
    end

    def guesser?
      @guesser
    end

    def winner?
      @winner
    end

    def get_master_answer(input = gets.chomp)
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
