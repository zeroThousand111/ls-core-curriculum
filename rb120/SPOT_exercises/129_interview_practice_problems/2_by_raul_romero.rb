=begin
# ================================================================

# Problem received from Raul Romero
class Human 
    attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end
  
end

puts Human.new("Jo").hair_colour("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")              
# Should "Hi, my name is Dylan and I have blonde hair."

# ================================================================
=end

# ================================================================

# Problem received from Raul Romero

class Human 
  attr_reader :name
  
  # one version of class method solution
  def self.hair_colour(colour) # class method that calls an instance method
    # `colour` argument actually not used, but required to accept test input
    human = Human.new # Human object in ::hair_colour class method required to call #hair_colour instance method
    human.hair_colour("blonde") # lateral thinking; just pass in the string "blonde" as the argument!
  end
  
  # shorter version of class method solution that does the same
  # def self.hair_colour(colour)
  #   self.new.hair_colour("blonde")
  # end

  def initialize(name="Dylan")
    @name = name
  end

  def hair_colour(colour) # need an instance method that outputs a string
    "Hi, my name is #{name} and I have #{colour} hair."
  end

end

puts Human.new("Jo").hair_colour("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_colour("")              
# Should "Hi, my name is Dylan and I have blonde hair."

# ================================================================

