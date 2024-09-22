=begin
A fighting fantasy tool:
1. A character generator
2. A monster generator
3. A fighting model

=end

class AliveObject
  # include Comparable

  attr_reader :skill, :max_stamina, :name
  attr_accessor :current_stamina

  def initialize(name)
    @name = name
    @skill = rand(6) + 4
    @max_stamina = rand(12) + 4
    @current_stamina = @max_stamina
  end

  def to_s
    "#{name} has a skill of #{skill} and current stamina of #{current_stamina}"
  end

  # def <=>(other)
  #   self<=>other
  # end

  def fight(other)
    my_score = skill + rand(12)
    other_score = other.skill + rand(12)

    puts "#{name}'s score is #{my_score}"
    puts "#{other.name}'s score is #{other_score}"

    if my_score > other_score
      puts "#{name} wins the round!"
      other.current_stamina -= 2
    elsif other_score > my_score
      puts "#{other.name} wins the round!"
      current_stamina -= 2
    else
      puts "this round is a draw!"
    end

  end

end

class Player < AliveObject

  attr_reader :luck

  def initialize(name)
    @name = name
    @skill = rand(6) + 6
    @max_stamina = rand(12) + 12
    @current_stamina = @max_stamina
    @luck = rand(6) + 6
  end

  def to_s
    super + " and a luck score of #{luck}"
  end
end

class Monster < AliveObject
end

goblin1 = Monster.new("goblin")
hero = Player.new("conan")

puts goblin1, hero
hero.fight(goblin1)
puts goblin1, hero
