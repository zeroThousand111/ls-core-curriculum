class AnimateObject
  attr_reader :combat_skill, :endurance

  def initialize(combat_skill, endurance)
    @combat_skill = combat_skill
    @endurance = endurance
  end

  def display_stats
    puts "REMINDER: you need to write a `display_stats` method for this class!"
  end
end

class Player < AnimateObject
  attr_reader :name

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
      chosen_skill = enter_skill
      chosen_endurance = enter_endurance
      super(chosen_skill, chosen_endurance)
      @name = choose_name
    else
      super(randomise_skill, randomise_endurance)
      @name = choose_name
    end
  end

  def display_stats
    puts ""
    puts "My name is #{name.upcase}."
    puts "My combat skill is : #{combat_skill}."
    puts "My endurance is : #{endurance}."
  end

  private

  def choose_name
    name_choice = nil
    loop do 
      puts "Please write your name:"
      name_choice = gets.chomp
      puts "You've chosen #{name_choice} as your name, is that correct? (Y/N)"
      validation = gets.chomp
      break if validation.downcase == "y"
    end
    name_choice
  end

  def enter_skill
    puts "Please enter your combat skill:"
    entry = gets.chomp
  end

  def enter_endurance
    puts "Please enter your endurance:"
    entry = gets.chomp
  end

  def randomise_skill
    rand(0..9) + 10
  end

  def randomise_endurance
    rand(0..9) + 20
  end
end

class Monster < AnimateObject
  attr_reader :name

  def initialize(name, combat_skill, endurance)
    super(combat_skill, endurance)
    @name = name
  end

  def display_stats
    puts ""
    puts "I am a #{name.upcase}."
    puts "My combat skill is : #{combat_skill}."
    puts "My endurance is : #{endurance}."
  end
end

class Fight
  def initialize
    monster = Monster.new("helghast", 10, 20)
    lone_wolf = Player.new

    monster.display_stats
    lone_wolf.display_stats
  end
end

# helghast = Monster.new("helghast", 10, 20)
# lone_wolf = Player.new

Fight.new

