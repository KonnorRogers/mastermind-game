root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/mastermind.rb"

puts "Welcome to Mastermind!"
Mastermind::Game.new.play
