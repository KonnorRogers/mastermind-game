module Mastermind
  class Game
    attr_reader :master_answer

    def initialize
    end

    def create_master_answer(input)
      input.map { |color| input.fetch(color) }
    end
  end
end
