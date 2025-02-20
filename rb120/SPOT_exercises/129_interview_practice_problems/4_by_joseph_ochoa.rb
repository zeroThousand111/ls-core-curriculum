=begin
# ================================================================


#describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters 
  
  def initialize(name) 
    #
    self.name 
    @characters = [] 
  end
  
  def display
    name
  end
  
  protected 
  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) # 
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb') 
rob = Monster.new('monst')
conan.characters << rob
p conan.display

# ================================================================
=end

# ================================================================


#describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters # attr_accessors written but the one for name overwritten under a protected access modifier below
  
  def initialize(name) # argument not used anywhere in constructor method
    #
    self.name         # this may invoke `name` getter on object, but doesn't do anything with it.  No output.  No assignment. 
    @characters = []  # this is an empty array collaborator object
  end
  
  def display
    name
  end
  
  protected
  # these overrule the public attr_accessor for @name written above
  attr_reader :name 
  attr_writer :name
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) # 
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb') 
# new Barbarian object instantiated with @name of 'nil', because of the way the #initialize method is written.  Argument `name` is not used anywhere.

rob = Monster.new('monst')
# as above. @name = nil.

conan.characters << rob
# invoking Array#<< on collaborator object for @characters, which will left-shift rob Monster object into that array i.e. Conan's @characters = [rob]

p conan.display # nil, because no name was ever assigned to @name.
# the protected attr_reader accessor allows `#display` to read @name in the class definition, so no NoMethodError exception is raised by the getter for @name being protected

# ================================================================