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

    def check_win(input)
      colors_array = []
      input.split(", ").each do |color|
        color = color.to_sym
        colors_array.push(color)
      end

      colors_array == @computer.final_answer

    end

    def valid_input?(input)
      input = input.split(", ")
      if (input.size == 4)
        if (input.all? { |color| ColorHelper::COLORS_ENUM.include?(color.to_sym) })
          return true
        end
      end

      return false
    end

    def play
      puts "Would you like to be the guesser? (Y/N)"
      decide_guesser

      if (player.guesser == true)
        @computer.select_random_colors
      else
        @player.get_master_answer
      end

      puts ""

      until winner?
        puts @board.formatted_grid
        puts @board.key

        if @player.guesser == true

          puts "#{@computer.final_answer}"
          puts "Enter a guess in the form: blue, blue, red, orange"
          input = gets.chomp.downcase

          until valid_input?(input) == true
            puts "Incorrect input"
            puts "Please enter your answer in the form: blue, red, red, blue"
            input = gets.chomp.downcase
          end


          if (check_win(input) == true)
            @player.winner = true
            puts ""
            puts "Congratulations! You have won!!"
          else
            @board.update_guesses(input)
            update_hints(input)
            @guesses += 1
          end
        # elsif @computer.guesser
        end
      end
    end

    def game_over?
      return winner? if winner? == true
    end

    private

    def winner?
      return true if @player.winner? == true
      return true if @computer.winner? == true
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

    def update_hints(input)
      colors_array = []

      if player.guesser
        answer = @computer.final_answer

        input.split(", ").each do |color|
          color = color.to_sym
          colors_array << color
        end


        correct_colors_and_positions = 0
        correct_colors = 0
        4.times do |index|
          if (answer[index] == colors_array[index])
            correct_colors_and_positions += 1
          end
        end

        4.times do |index|
          if (answer.include?(colors_array[index]))
            correct_colors += 1
          end
        end

        correct_colors -= correct_colors_and_positions

        4.times do |index|
          index -= 3

          if(correct_colors_and_positions > 0)
            @board.set_hint_cell(index, @guesses, String::black_bullet)
            correct_colors_and_positions -= 1
          elsif(correct_colors > 0)
            @board.set_hint_cell(index, @guesses, String::white_bullet)
            correct_colors -= 1
          else
            @board.set_hint_cell(index, @guesses, String::blank_bullet)
          end
        end
      else
      end
    end
  end
end
