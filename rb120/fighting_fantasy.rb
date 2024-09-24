=begin
## FUNCTIONS
A fighting fantasy tool:
1. A character generator
2. A monster generator
3. A fighting model

## CHARACTER GENERATOR

## MONSTER GENERATOR

## FIGHT MODEL

## HEIRARCHY

AliveObject
  - Player
  - Monster
    - Goblin

Game
  - Fight

=end

class AliveObject
  # include Comparable
  attr_reader :skill, :max_stamina, :name
  attr_accessor :current_stamina

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name} has a skill of #{skill} and current stamina of #{current_stamina}"
  end

  # def <=>(other)
  #   self<=>other
  # end

  def fight(other)
    my_score = skill + rand(1..12)
    other_score = other.skill + rand(1..12)

    puts "#{name}'s score is #{my_score}"
    puts "#{other.name}'s score is #{other_score}"

    if my_score > other_score
      puts "#{name} wins the round!"
      other.current_stamina -= 2
    elsif other_score > my_score
      puts "#{other.name} wins the round!"
      self.current_stamina -= 2
    else
      puts "this round is a draw!"
    end
  end
end

class Player < AliveObject
  attr_reader :luck

  def initialize(name)
    super
    @skill = rand(7..12)
    @max_stamina = rand(13..24)
    @current_stamina = @max_stamina
    @luck = rand(7..12)
  end

  def to_s
    super + " and a luck score of #{luck}"
  end
end

class Monster < AliveObject
  def initialize(name)
    super
    @skill = rand(5..10)
    @max_stamina = rand(5..16)
    @current_stamina = @max_stamina
  end
end

class Game
  def play
    monster = Monster.new("goblin")
    hero = Player.new("conan")
    puts monster, hero
    loop do
      hero.fight(monster)
      break if monster.current_stamina == 0 || hero.current_stamina == 0
    end
    puts monster, hero
  end
end

Game.new.play
