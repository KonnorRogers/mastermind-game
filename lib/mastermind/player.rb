module Mastermind
  class Player
    attr_reader :name, :guesser

    def initialize(input)
      @name = input.fetch(:name)
      @guesser = input.fetch(:guesser)
    end
  end
end
