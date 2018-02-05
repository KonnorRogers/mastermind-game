class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
    #"ESC[color"m"#{self}\e[0m"
    #escapes the esc character
  end

  def red
    colorize("31")
  end

  def black
    colorize("30;47")
  end

  def blue
    colorize("34")
  end

  def cyan
    colorize("36")
  end

  def purple
    colorize("35")
  end

  def green
    colorize("32")
  end

  def yellow
    colorize("33")
  end

  def self.white_bullet
    "\u25e6"
  end

  def self.hollow_bullet
    "\u2022"
  end

  def self.black_bullet
    hollow_bullet.black
  end
end
