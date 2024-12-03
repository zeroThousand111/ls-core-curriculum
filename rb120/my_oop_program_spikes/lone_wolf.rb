class AnimateObject
  attr_reader :name, :combat_skill, :endurance

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
      puts "You've chosen #{name_choice.upcase} as the name of the #{self.class}, is that correct? (Y/N)"
      validation = gets.chomp
      break if validation.downcase == "y"
    end
    name_choice
  end

  def display_stats
    puts "REMINDER: you need to write a `display_stats` method for this class!"
  end

  def choose_skill
    skill = nil
    loop do
      puts "Please enter the endurance of #{self.class}:"
      skill = gets.chomp
      break if valid_stat?(skill)
      puts "Sorry, that input isn't valid."
    end
    skill.to_i
  end

  def choose_endurance
    endurance = nil
    loop do
      puts "Please enter the endurance of #{self.class}:"
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
      # chosen_skill = choose_skill
      # chosen_endurance = choose_endurance
      # super(chosen_skill, chosen_endurance)
      # @name = choose_name
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

  def display_stats
    puts ""
    puts "I am a #{name.upcase}."
    puts "My combat skill is : #{combat_skill}."
    puts "My endurance is : #{endurance}."
  end
end

class Fight
  def initialize
    monster = Monster.new
    lone_wolf = Player.new

    monster.display_stats
    lone_wolf.display_stats
  end
end

Fight.new

