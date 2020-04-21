require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant  |"
puts "----------------------------------------------"
my_game=Game.new("Wolverine")
puts "Nom du premier joueur ?"
name_human =HumanPlayer.new(gets.chomp)
playera=Player.new("Joseph")
playerb=Player.new("Jose")
playerc=Player.new("Josephia")
playerd=Player.new("Josephine")
@enemies =[playera, playerb, playerc,playerd]
while my_game.is_still_ongoing? == true
  menu
  puts " "
end
binding.pry
puts "end of file"