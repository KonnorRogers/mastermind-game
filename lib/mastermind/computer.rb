module Mastermind
  class Computer
    attr_reader :computer, :master_answer, :color_helper
    attr_accessor :guesser, :winner

    def initialize
      @computer = 'computer'
      @color_helper = ColorHelper.new
      @guesser = false
      @winner = false
    end

    def select_random_colors
      random = Random.new
      @master_answer = []

      4.times do |random_color|
        random_number = random.rand(0..5)
        color = ColorHelper::COLORS_ENUM[random_number]
        @master_answer.push(color)
      end

      @master_answer
    end

    def final_answer
      @master_answer
    end

    def print_final_answer(answer)
      puts ""
      answer.each do |color|

        print @color_helper.change_guess(color)
        print " "
      end

      puts " is the master answer you guessed correctly!"
    end

    def winner?
      @winner
    end
  end
end
