=begin
# ================================================================

class Human  # Problem received from Raul Romero
  attr_reader :name 
  
  def initialize(name)
  end
 
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) #should output true # 
puts anna + gilles # should output annagilles 


# ================================================================
=end

# ================================================================

class Human  # Problem received from Raul Romero
  attr_reader :name 
  
  def initialize(name)
    @name = name # instance variable required
  end
 
  def equal?(other)
    self.name == other.name
    # self.class == other.class # this would also return true
    # true # this would also work in the spirit of lateral thinking!
  end

  def +(other)
    "anna" + other.name
    # "annagilles" would also work!
  end
end

gilles = Human.new("gilles") 
anna = Human.new("gilles") 

puts anna.equal?(gilles) #should output true # 
puts anna + gilles # should output annagilles 


# ================================================================