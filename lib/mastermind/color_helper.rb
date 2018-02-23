module Mastermind
  class ColorHelper
    attr_reader :COLORS_ENUM

    COLORS_ENUM = [
      :red,
      :blue,
      :cyan,
      :purple,
      :green,
      :orange
    ]

    def change_guess(text)
      if COLORS_ENUM.include?(text)
        case text
        when :blue
          String::circle.blue
        when :red
          String::circle.red
        when :cyan
          String::circle.cyan
        when :orange
          String::circle.orange
        when :purple
          String::circle.purple
        when :green
          String::circle.green
        end

      else return false
      end
    end
  end
end
