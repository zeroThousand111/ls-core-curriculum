=begin
Dungeons & Dragons Character Generator
5th Edition (5e) Rules
Based upon the Systems Reference Document (SRD)
https://media.wizards.com/2023/downloads/dnd/SRD_CC_v5.1.pdf
=end

class Race
  attr_reader :race

  RACES = ['dragonborn', 'human', 'halfling', 'dwarf', 'elf', 'half elf',
           'gnome', 'half orc', 'tiefling']

  def choose_race
    choice = ''
    loop do
      puts "Choose your race:"
      puts "Human, Halfling, Dwarf, Elf, Half Elf, Dragonborn, Gnome"
      puts "Half Orc or Tiefling."
      choice = gets.chomp
      break if RACES.include?(choice)
      puts "That choice isn't valid.  Please try again."
    end
    choice
  end

  def initialize
    @race = choose_race
  end

  def to_s
    race.upcase
  end
end

class Attributes
  attr_accessor :strength, :dexterity, :constitution,
                :intelligence, :wisdom, :charisma

  def human_modifiers
    self.strength += 1
    self.dexterity += 1
    self.constitution += 1
    self.intelligence += 1
    self.wisdom += 1
    self.charisma += 1
  end

  def halfling_modifiers
    self.dexterity += 2
  end

  def dragonborn_modifiers
    self.strength += 2
    self.charisma += 1
  end

  def elf_modifiers
    self.dexterity += 2
  end

  def half_elf_modifiers
    self.dexterity
    self.charisma
  end

  def dwarf_modifiers
    self.constitution += 2
  end

  def gnome_modifiers
    self.intelligence += 2
  end

  def half_orc_modifiers
    self.strength += 2
    self.constitution += 1
  end

  def tiefling_modifers
    self.intelligence += 1
    self.charisma += 2
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def racial_modifiers(race)
    case race
    when 'human'
      human_modifiers
    when 'halfling'
      halfling_modifiers
    when 'dragonborn'
      dragonborn_modifiers
    when 'elf'
      elf_modifiers
    when 'half elf'
      half_elf_modifiers
    when 'dwarf'
      dwarf_modifiers
    when 'gnome'
      gnome_modifiers
    when 'half orc'
      half_orc_modifiers
    when 'tiefling'
      tiefling_modifiers
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity

  def generate_attributes
    @strength = roll4d6
    @dexterity = roll4d6
    @constitution = roll4d6
    @intelligence = roll4d6
    @wisdom = roll4d6
    @charisma = roll4d6
  end

  def initialize(race)
    generate_attributes
    racial_modifiers(race)
  end

  def to_s
    "     Strength: #{strength}
     Dexterity: #{dexterity}
     Constitution: #{constitution}
     Intelligence: #{intelligence}
     Wisdom: #{wisdom}
     Charisma: #{charisma}"
  end

  private

  def roll4d6
    array = []
    4.times do |_|
      array << rand(1..6)
    end
    array.max(3).sum
  end
end

class Character
  attr_accessor :attributes, :race

  def initialize
    @race = Race.new
    @attributes = Attributes.new(race)
  end

  def to_s
    puts ""
    puts "The attributes of your #{race} character are:"
    puts ""
    puts attributes
  end
end

class Creation
  attr_reader :my_character

  # rubocop:disable Metrics/MethodLength
  def reroll?
    valid_choices = ['y', 'n']
    answer = ''
    loop do
      puts ""
      puts "Do you want to re-roll new attributes? (y or n)"
      answer = gets.chomp.downcase
      break if valid_choices.include?(answer)
      puts "Please only answer y or n"
    end
    return true if answer == 'y'
    false
  end
  # rubocop:enable Metrics/MethodLength

  def hello_message
    puts "Welcome to DnD 5e Character Generator!"
    puts "It's based upon the Systems Reference Document (SRD)."
    puts "https://media.wizards.com/2023/downloads/dnd/SRD_CC_v5.1.pdf"
    puts "It uses the 'best 3 of 4d6' mechanic for generating attributes."
    puts ""
  end

  def goodbye_message
    puts "Thanks for using DnD 5e Character Generator.  Goodbye!"
  end

  def write_char_data
    file = File.open("char_data.txt", "w") { |f| f.write "#{Time.now} - User logged in\n" }
    File.write("char_data.txt", my_character, mode: "a")
  end

  def initialize
    hello_message
    @my_character = nil
    loop do
      @my_character = Character.new
      system "clear"
      my_character.display
      break unless reroll?
    end
    write_char_data
    goodbye_message
  end

  def to_s
    my_character.to_s
  end
end

Creation.new
