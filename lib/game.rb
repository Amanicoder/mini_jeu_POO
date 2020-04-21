require 'pry'

class Game
  attr_accessor :human_player, :enemies
  def initialize (human_player)
    my_game = Game.new(human_player)
    puts "le jeu #{my_game} commence!"
  end
  def kill_player(player_to_kill)
    @enemies= enemies.delete(player_to_kill)
  end
  def is_still_ongoing?
    @human_player.life_points>0 & enemies.length>0
  end
  def show_players
    puts "l'état de votre joueur est #{@human_player.life_points}"
    puts "le nombre des joueurs ennemis restant est #{@enemies.length}"
  end
  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts"s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    enemies.each do |i|
      enemies_alive = @enemies
      if i.life_points>0
      print "#{[0,1,2,3].each} - #{i.show_state}"
      else enemies_alive = enemies.delete(i)
      end
    end
    def enemies_attack
      enemies_alive.each { |x| x.attacks(@human_player) }
    end
  end
  def end_of_game
    puts "   "
    puts "La partie est finie"
    if human_player.show_state>0
      puts "BRAVO ! TU AS GAGNE !"
    else puts  "Loser ! Tu as perdu !"
  end
  end
  def game_choice
    user_choice =gets.chomp
    if user_choice== "a"
      human_player.search_weapon
    elsif user_choice== "s"
      human_player.search_health_pack
    elsif user_choice== "0"
      puts "#{human_player.attacks(player1)}"
    elsif user_choice== "1"
      puts "#{human_player.attacks(player2)}"
    end
  end

  end #fin de ma classe
binding.pry
puts "end of file"