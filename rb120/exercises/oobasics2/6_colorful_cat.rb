=begin
Colorful Cat
Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the name and color of the cat. Use a constant to define the color.

kitty = Cat.new('Sophie')
kitty.greet

Expected output:

Hello! My name is Sophie and I'm a purple cat!
=end

# the boring solution to the question

class Cat
  
  attr_reader :name,
  
  COLOR = "purple"
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
  
  private
  
  def pick_a_color
    ["purple", "orange", "tabby", "black", "black and white"].sample
  end
end

# random cat color chosen - more fun but color has to be an instance variable not a constant

# class Cat
  
#   attr_reader :name, :color
  
#   def initialize(name)
#     @name = name
#     @color = pick_a_color
#   end
  
#   def greet
#     puts "Hello! My name is #{name} and I'm a #{color} cat!"
#   end
  
#   private
  
#   def pick_a_color
#     ["purple", "orange", "tabby", "black", "black and white"].sample
#   end
# end

kitty = Cat.new('Sophie')
kitty.greet