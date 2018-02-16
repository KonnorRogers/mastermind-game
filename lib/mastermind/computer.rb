module Mastermind
  class Computer
    attr_reader :computer, :random_answer, :color_helper
    attr_accessor :guesser

    def initialize
      @computer = 'computer'
      @color_helper = ColorHelper::COLORS_ENUM
      @guesser = false
    end

    def select_random_colors
      random = Random.new
      @random_answer = []

      4.times do |random_color|
        random_number = random.rand(0..5)
        color = @color_helper[random_number]
        @random_answer.push(color)
      end

      @random_answer
    end

    def print_random_colors
      select_random_colors.join(", ")
    end
  end
end
