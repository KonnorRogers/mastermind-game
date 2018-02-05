require "spec_helper"

RSpec.describe String do
  context "#colorize" do
    it "returns a red string when colorized" do
      red = 31
      puts "\thi".colorize(red)
    end
  end

  context "#red" do
    it "returns a red string" do
      puts "\tTest".red
    end
  end

  context "#black" do
    it "returns a black string w/ white background" do
      puts "\t" + "Test".black
    end
  end

  context "#blue" do
    it "returns a blue String" do
      puts "\tTest".blue
    end
  end

  context "#cyan" do
    it "returns a cyan string" do
      puts "\tTest".cyan
    end
  end

  context "#purple" do
    it "returns a purple string" do
      puts "\tTest".purple
    end
  end

  context "#green" do
    it "returns a green string" do
      puts "\tTest".green
    end
  end

  context "#yellow" do
    it "returns a yellow String" do
      puts "\tTest".yellow
    end
  end


  context "#hollow_bullet" do
    it "returns a hollow_bullet" do
      puts "\t" + String::blank_bullet
    end
  end

  context "#black_bullet" do
    it "returns a black_bullet" do
      puts "\t" + String::black_bullet
    end
  end

  context "#white_bullet" do
    it "returns a white_bullet" do
      puts "\t" + String::white_bullet
    end
  end

  context "#circle" do
    it "returns a solid white circle" do
      puts "\t" + String::circle
    end

    it "returns a blue circle" do
      puts "\t" + String::circle.blue
    end
  end

  context "#blank_circle" do
    it "returns a blank circle" do
      puts "\t" + String::blank_circle
    end
  end
end
