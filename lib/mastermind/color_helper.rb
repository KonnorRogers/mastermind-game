module Mastermind
  class ColorHelper
    attr_reader :COLORS_ENUM

    COLORS_ENUM = [
      :red,
      :blue,
      :cyan,
      :purple,
      :green,
      :yellow
    ]

    def change_guess(text)

      case text
      when :blue
        String::circle.blue + " "
      when :red
        String::circle.red + " "
      when :cyan
        String::circle.cyan + " "
      when :orange
        String::circle.orange + " "
      when :purple
        String::circle.purple + " "
      when :green
        String::circle.green + " "
      else
        String::circle + " "
      end
    end
  end
end
