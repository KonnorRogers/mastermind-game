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

    def check_player_win(input)
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

      until game_over?
        puts @board.formatted_grid
        puts @board.key

        if @player.guesser
          puts "Enter a guess in the form: blue, blue, red, orange"
          input = gets.chomp.downcase

          until valid_input?(input)
            puts "Incorrect input"
            puts "Please enter your answer in the form: blue, red, red, blue"
            input = gets.chomp.downcase
          end

          if (check_player_win(input))
            @player.winner = true
            @computer.print_final_answer(@computer.final_answer)
            puts ""
            puts "Congratulations! You have won!!"
            break
          else
            @board.update_guesses(input)
            update_hints(input)
            @guesses += 1
          end
        end
      end
    end

    def game_over?
      return winner? if winner? == true
    end

    def input_to_symbol(input)
      colors_array = []
      input.split(", ").each do |color|
        color = color.to_sym
        colors_array << color
      end
      colors_array
    end

    def correct_colors_and_positions(input)
      answer = @computer.final_answer
      colors_array = input_to_symbol(input)

      correct_colors_and_positions = 0

      4.times do |index|
        if (answer[index] == colors_array[index])
          correct_colors_and_positions += 1
        end
      end

      puts correct_colors_and_positions
      correct_colors_and_positions
    end

    def correct_colors(input)
      answer = @computer.final_answer
      colors_array = input_to_symbol(input)

      correct_colors = 0
      #changes the values so theyre not tallied twice
      answer.each do |answer_color|
        colors_array.each do |guess_color|
          if guess_color == answer_color
            answer_color = "1"
            guess_color = "0"
            correct_colors += 1
          end
        end
      end

      puts correct_colors
      correct_colors -= correct_colors_and_positions(input)
    end

    private

    def winner?
      return true if @player.winner? == true
      if @guesses >= @@MAX_GUESSES
        puts "Computer has won! You have had too many guesses!"
        return true
      end
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

      if player.guesser
        set_hint_cells(input)
      else

      end
    end

    def set_hint_cells(input)
      correct_colors_and_positions = correct_colors_and_positions(input)
      correct_colors = correct_colors(input)

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
    end
  end
end
