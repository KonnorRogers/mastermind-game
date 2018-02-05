module Mastermind
  class Board
    attr_reader :guesses, :hints

    def initialize(input = {})
      @guesses = input.fetch(:guesses, default_guesses)
      @hints = input.fetch(:hints, default_hints)
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

    def game_over?
      return :winner if winner?
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
