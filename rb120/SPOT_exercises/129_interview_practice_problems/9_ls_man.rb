=begin
# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
  end
end

class Superhero    
  attr_accessor :ability
  
  def self.fight_crime
  end
  
  def initialize(name)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
# ========================================================================
=end

# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    "I am #{name}, I am a #{self.class.to_s.downcase}, and I can fly!"
  end
end

class Superhero    
  include Flightable
  attr_accessor :ability
  attr_reader :name
  
  def self.fight_crime # class method
    puts "I am #{self}"
    # superhero = self.new("")
    # superhero.announce_ability
    self.new("").announce_ability
  end
  
  def initialize(name)
    @name = name
    @ability = Ability.new("coding skills")
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def to_s
    description
  end
end

superman = Superhero.new('Superman')

p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
# ========================================================================