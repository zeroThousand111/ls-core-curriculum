=begin
# ================================================================

# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

class Monster
  def attack
    "attacks!"
  end
end

class Barbarian
  
end
    
# ================================================================
=end

# ================================================================

# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 

  # Class Inheritance

  class Monster
    def attack
      "attacks!"
    end
  end
  
  class Barbarian < Monster
    
  end

  puts Barbarian.new.attack

  # Mixin Module

  module Attackable
    def attack
      "attacks!"
    end
  end

  class Monster
    include Attackable
  end
  
  class Barbarian
    include Attackable
  end

  puts Barbarian.new.attack

  # Duck Typing

  class Monster
    def attack
      "attacks!"
    end
  end
  
  class Barbarian
    def attack
      "attacks!"
    end
  end

  puts Barbarian.new.attack

      
  # ================================================================

