# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'
player1 =Player.new("Josiane")
player2 =Player.new("Jose")
while player1.life_points>0 && player2.life_points>0

puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts" "
puts "Passons à la phase d'attaque :"
puts "#{player1.attacks(player2)}"
if player2.life_points<=0 then
  break
end
puts "#{player2.attacks(player1)}"
end
if player2.life_points<=0
puts "#{player2.name} a été tué!"
else
  puts " #{player1.name} a été tuée!"
end
binding.pry
# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.