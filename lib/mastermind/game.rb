module Mastermind
  class Game
    attr_reader :board, :computer, :player, :guesses, :color_helper

    @@MAX_GUESSES = 12

    def initialize(board = Board.new)
      @board = board
      @computer = Computer.new
      @player = Player.new({ name: "Player1", guesser: true })

      @guesses = 0
      @color_helper = ColorHelper.new
    end

    def play
      puts "Would you like to be the guesser? (Y/N)"
      decide_guesser

      puts ""

      until game_over?
        puts @board.formatted_grid
        puts @board.key

        if @player.guesser
          puts "Enter a guess in the form, blue, blue, red, orange"
          input = gets.chomp.downcase

          if (input == @computer.final_answer)
            @player.winner = true
          else

            @guesses += 1
          end
        end
      end
    end

    def game_over?
      return winner? if winner?
      return @guesses > @@MAX_GUESSES
    end

    private

    def winner?
      return true if @player.winner?
      return true if @computer.winner?
      false
    end

    def decide_guesser(input = gets.chomp.downcase)
      while true
        if (input == "y")
          @computer.guesser = false
          @player.guesser = true
          puts "You are the guesser!"
          break
        elsif(input == "n")
          @computer.guesser = true
          @player.guesser = false
          puts "The computer will guess the your secret code."
          break
        else
          puts "Improper input given, enter y to be the guesser, n if not"
          decide_guesser
          break
        end
      end
    end
  end
end
