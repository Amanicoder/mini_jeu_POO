require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant  |"
puts "----------------------------------------------"
puts "Nom du premier joueur ?"
user =HumanPlayer.new(gets.chomp)
player1=Player.new("Josiane")
player2=Player.new("Jose")
enemis =[player1, player2]
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts "Voici l'état de votre joueur :"
  user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts"s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  print "0 - #{player1.show_state}"
  print "1 - #{player2.show_state}"
  puts ">"
  user_choice =gets.chomp
  if user_choice== "a"
    user.search_weapon
  elsif user_choice== "s"
    user.search_health_pack
  elsif user_choice== "0"
    puts "#{user.attacks(player1)}"
  elsif user_choice== "1"
    puts "#{user.attacks(player2)}"
  end
  puts "  "
  enemis.each do |i|
    puts "Les autres joueurs t'attaquent !"
    if i.life_points > 0
    i.attacks(user)
    else "le joueur #{i.name} a été tué"
    end
    end
end
puts "   "
puts "La partie est finie"
if user.life_points>0
puts "BRAVO ! TU AS GAGNE !"
else puts  "Loser ! Tu as perdu !"
end
binding.pry
puts "end of file"