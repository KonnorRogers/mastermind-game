module Mastermind
  class Board
    attr_accessor :y
    attr_reader :guesses, :hints, :color_helper

    def initialize(input = {})
      @guesses = input.fetch(:guesses, default_guesses)
      @hints = input.fetch(:hints, default_hints)
      @color_helper = ColorHelper.new
      @y = 0
    end

    def get_guess_cell(x, y)
      guesses[y][x]
    end

    def set_guess_cell(x, y, value)
      get_guess_cell(x, y).value = value
    end

    def get_hint_cell(x, y)
      hints[y][x]
    end

    def set_hint_cell(x, y, value)
      get_hint_cell(x, y).value = value
    end

    def update_guesses(input)
      converted_guesses = input.split(", ").map { |color| @color_helper.change_guess(color.to_sym) }

      while @y < 12
        if get_guess_cell(0, @y) != String::blank_circle
          x = 0
          while x < 4
            set_guess_cell(x, @y, converted_guesses[x])
            x += 1
          end

          @y += 1
          break
        end
        @y += 1
      end
    end

    def game_over?
      return :winner if winner?
    end

    def formatted_grid

      formatted_array = []

      i = 0
      while i < 12
        guesses_and_hints = []
        guesses_and_hints << "| "

        j = 0
        while j < 4
          guess = @guesses[i][j].value + "  "
          guesses_and_hints << guess
          j += 1
        end

        guesses_and_hints << " | "

        x = 0
        while x < 4
          hint = @hints[i][x].value
          guesses_and_hints << hint
          x += 1
        end

        formatted_array << guesses_and_hints.join + " |"

        i += 1
      end

      formatted_array
    end

    def key
      print "#{String::circle.blue} = blue "
      print "#{String::circle.red} = red "
      puts "#{String::circle.purple} = purple "
      print "#{String::circle.cyan} = cyan "
      print "#{String::circle.green} = green "
      print "#{String::circle.orange} = orange "

    end

    private

    def default_guesses
      Array.new(12) { Array.new(4) { Cell.new(String::blank_circle) }}
    end

    def default_hints
      Array.new(12) { Array.new(4) { Cell.new(String::blank_bullet) }}
    end
  end
end
