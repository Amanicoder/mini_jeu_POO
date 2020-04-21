class Player
    attr_accessor :name, :life_points
     # on initialise la variable de classe

    def initialize(name_player)
      @name =name_player
      @life_points= 10
    end
    def show_state
      puts "#{@name} a #{@life_points} points de vie"
    end
    def gets_damage(fight_damage)
      @life_points=@life_points-fight_damage
      if @life_points<=0
        puts "le joueur #{@name} a été tué!"
        else puts "#{@name} a #{@life_points} points de vie"
      end
    end
    def attacks (player_attacked)
      puts "le joueur #{@name} attaque  #{player_attacked.name}"
      damage_attack=compute_damage
      player_attacked.life_points=player_attacked.life_points-damage_attack
      puts "il lui inflige #{damage_attack} points de dommages"
    end
    def compute_damage
      return rand(1..6)
    end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_human)
    @name=name_human
    @weapon_level =1
    @life_points= 100
  end
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end
  def compute_damage
  rand(1..6) * @weapon_level
  end
  def search_weapon
    new_weapon=rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon>weapon_level
      @weapon_level=new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  def search_health_pack
    health_pack =rand(1..6)
    if health_pack==1
      puts "Tu n'as rien trouvé... "
    elsif health_pack.between?(2,5)
      if (life_points+ 50) <100
        @life_points=life_points+50
      else @life_points = 100
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      if (life_points+ 50) <100
        @life_points=life_points+50
      else @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end

puts "end of file"