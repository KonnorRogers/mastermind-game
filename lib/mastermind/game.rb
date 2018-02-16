module Mastermind
  class Game
    attr_reader :master_answer, :player, :computer, :guesser

    def initialize(board = Board.new)
      @board = board
      @computer = Computer.new
    end

    def get_player_info
      player_message = "Input your name: "
      puts "#{player_message}"
      @player = gets.chomp
    end

    def decide_guesser
      while true
        decide_guesser = "Would you like to be the guesser? (Y/N)"
        puts "#{decide_guesser}"
        guesser = gets.chomp.downcase

        if (guesser == "y")
          @player.guesser = true
          @computer.guesser = false
          break
        elsif (guesser == "n")
          @player.guesser = false
          @computer.guesser = true
          break
        else
          puts "Improper input, try again"
        end
      end
    end

    def play
    end


  end
end
