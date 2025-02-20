=begin
# ========================================================================
# Unknown
class BenjaminButton 
  
  def initialize
  end
  
  def get_older
  end
  
  def look_younger
  end
  
  def die
  end
end

class BenjaminButton
end


benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0

# ========================================================================
=end

# ========================================================================
# Unknown
class BenjaminButton
  attr_accessor :actual_age, :appearance_age
  # the setter for @actual_age doesn't need to change @appearance_age at the same time, despite one thinking that it ought to!

  def initialize
    @actual_age = 0
    @appearance_age = 100
  end

  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end
  
  def look_younger # not actually required for problem
    self.actual_age -= 1
    self.appearance_age += 1
  end
  
  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

benjamin = BenjaminButton.new
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1 # setter method required
p benjamin.actual_age # => 1

benjamin.get_older
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0

# ========================================================================