class AnimateObject
  attr_reader :name, :combat_skill
  attr_accessor :endurance

  def initialize
    @name = choose_name
    @combat_skill = choose_skill
    @endurance = choose_endurance
  end

  def choose_name
    name_choice = nil
    loop do 
      puts "Please write the #{self.class} name:"
      name_choice = gets.chomp
      # puts "You've chosen #{name_choice.upcase} as the name of the #{self.class}, is that correct? (Y/N)"
      # validation = gets.chomp
      # break if validation.downcase == "y"
      break
    end
    name_choice
  end

  def display_stats
    puts ""
    puts "Name: #{name.upcase}."
    puts "Combat Skill: #{combat_skill}."
    puts "Endurance: #{endurance}."
  end

  def display_endurance
    puts "Current endurance of #{name.upcase}: #{endurance}"
  end

  def choose_skill
    skill = nil
    loop do
      puts "Please enter the COMBAT SKILL of #{self.class}:"
      skill = gets.chomp
      break if valid_stat?(skill)
      puts "Sorry, that input isn't valid."
    end
    skill.to_i
  end

  def choose_endurance
    endurance = nil
    loop do
      puts "Please enter the ENDURANCE of #{self.class}:"
      endurance = gets.chomp
      break if valid_stat?(endurance)
      puts "Sorry, that input isn't valid."
    end
    endurance.to_i
  end

  private

  def valid_stat?(entry)
    entry.chars.all? do |char|
      (0..9).to_a.map(&:to_s).include?(char)
    end
  end
end

class Player < AnimateObject
  def initialize
    valid_choices = ["y", "n"]

    stats_already = nil
    loop do
      puts "Do you already have stats for your player? (Y/N)"
      stats_already = gets.chomp
      break if valid_choices.include?(stats_already.downcase)
      "That's not a valid answer.  Choose Y/N"
    end

    if stats_already == "y"
      super
    else
      @name = choose_name
      @combat_skill = randomise_skill
      @endurance = randomise_endurance
    end
  end

  private

  def randomise_skill
    rand(0..9) + 10
  end

  def randomise_endurance
    rand(0..9) + 20
  end
end

class Monster < AnimateObject
  def initialize
    super
  end
end

class Fight
  attr_reader :combat_ratio

  @@rounds = 0

  def initialize # the orchestration method
    monster = Monster.new
    player = Player.new
    display_all_stats(monster, player)
    @combat_ratio = player.combat_skill - monster.combat_skill
    display_combat_ratio
    loop do
      one_round(monster, player)
      display_endurances_both(monster, player)
      # break
      break if monster.endurance <= 0 || player.endurance <= 0
    end
    determine_winner(monster, player)
  end

  def display_all_stats(monster, player)
    monster.display_stats
    player.display_stats
  end

  def display_endurances_both(monster, player)
    monster.display_endurance
    player.display_endurance
  end

  def display_combat_ratio
    puts ""
    puts "Combat ratio is: #{combat_ratio}."
  end

  def one_round(monster, player)
    @@rounds += 1
    random_number = rand(0..9)
    puts ""
    puts "The random number is: #{random_number}"
    monster.endurance -= calculate_monster_damage(random_number)
    player.endurance -= calculate_player_damage(random_number)
  end

  def determine_winner(monster, player)
    puts ""
    puts "After #{@@rounds} rounds..."
    display_endurances_both(monster, player)
    if monster.endurance <= 0 && player.endurance > 0 # monster dies
      puts "#{player.name.upcase}, you are victorious!"
    elsif monster.endurance > 0 && player.endurance <= 0 # player dies
      puts "Unfortunately, #{player.name.upcase}, your quest ends here." 
    elsif monster.endurance <= 0 && player.endurance <=0 # both die
      puts "Well that's a turn up!"
      puts "Both #{player.name.upcase} and #{monster.name.upcase} have died!"
    end
  end

  private

  # damage calculations only present for combat ratio of 8

  def calculate_monster_damage(random_number)
    damage = 0
    case combat_ratio
    when -10..-9
    when -8..-7
    when -6..-5
    when -4..-3
    when -2..-1
    when 0
    when 1..2
    when 3..4
    when 5..6
    when 7..8
      case random_number
      when 1
        damage = 7
      when 2
        damage = 8
      when 3
        damage = 9
      when 4
        damage = 10
      when 5
        damage = 11
      when 6
        damage = 12
      when 7
        damage = 14
      when 8
        damage = 16
      when 9
        damage = 18
      when 0
        damage = 18
      end
    when 9..10
    when 11..100
    end
    damage
  end

  def calculate_player_damage(random_number)
    damage = 0
    case combat_ratio
    when -10..-9
    when -8..-7
    when -6..-5
    when -4..-3
    when -2..-1
    when 0
    when 1..2
    when 3..4
    when 5..6
    when 7..8
      case random_number
      when 1
        damage = 4
      when 2
        damage = 3
      when 3
        damage = 2
      when 4
        damage = 2
      when 5
        damage = 2
      when 6
        damage = 1
      when 7
        damage = 0
      when 8
        damage = 0
      when 9
        damage = 0
      when 0
        damage = 0
      end
    when 9..10
    when 11..100
    end
    damage
  end
end

Fight.new
