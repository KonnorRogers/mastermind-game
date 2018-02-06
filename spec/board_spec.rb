require "spec_helper"

module Mastermind
  RSpec.describe Board do
    context "#initialize" do
      it "does not raise an error w/ input given" do
        expect { Board.new(guesses: "guesses", hints: "hints") }.to_not raise_error
      end

      it "creates an array for guesses 12 rows high" do
        board = Board.new
        expect(board.guesses.size).to eq 12
      end

      it "creates an array for guesses with 4 columns each" do
        board = Board.new
        board.guesses.each do |row|
          expect(row.size).to eq 4
        end
      end

      it "creates an array for hint with 12 rows" do
        board = Board.new
        expect(board.hints.size).to eq 12
      end

      it "creates an array for hints with each row having 4 columns" do
        board = Board.new
        board.hints.each do |row|
          expect(row.size).to eq 4
        end
      end
    end

    context "#guesses" do
      it "returns the array of guesses" do
        board = Board.new(guesses: "blah")
        expect(board.guesses).to eq("blah")
      end

      it "returns the default guess array w/ no input" do
        board = Board.new
        board.guesses.each do |row|
          row.each do |cell|
            expect(cell.value).to eq String::blank_circle
          end
        end
      end
    end

    context "#hints" do
      it "returns the array of hints" do
        board = Board.new(hints: "blah")
        expect(board.hints).to eq("blah")
      end

      it "returns the default hints array w/ no input" do
        board = Board.new
        board.hints.each do |row|
          row.each do |cell|
            expect(cell.value).to eq String::blank_bullet
          end
        end
      end
    end

    context "#get_guess_cell" do
      it "returns the cell from the guesses array" do
        guesses = [["", "", ""], ["", "", "something"], ["", "", ""]]
        board = Board.new(guesses: guesses)
        expect(board.get_guess_cell(2, 1)).to eq "something"
      end
    end

    Thing = Struct.new(:value)

    context "#set_guess_cell" do
      it "sets the guess cell's value" do
        guesses = [[Thing.new("old_thing"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(guesses: guesses)
        board.set_guess_cell(0, 0, "new_thing")
        expect(board.get_guess_cell(0, 0).value).to eq "new_thing"
      end
    end

    context "get_hint_cell" do
      it "gets the hint cell's value" do
        hints = [["", "", "not_empty"], ["", "", ""], ["", "", ""]]
        board = Board.new(hints: hints)
        expect(board.get_hint_cell(2, 0)).to eq "not_empty"
      end
    end

    context "#set_hint_cell" do
      it "sets the hint cell's value" do
        hints = [[Thing.new("old_thing"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(hints: hints)
        board.set_hint_cell(0, 0, "new_thing_2")
        expect(board.get_hint_cell(0, 0).value).to eq "new_thing_2"
      end
    end
  end
end
