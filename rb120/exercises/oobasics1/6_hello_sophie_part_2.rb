=begin
Hello, Sophie! (Part 2)
Using the code from the previous exercise, move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked.

Code:

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

Expected output:

Hello! My name is Sophie!

=end

# 1 - Simply "getting" the instance variable

# class Cat
#   def initialize(name)
#     @name = name
#   end
  
#   def greet
#     puts "Hello! My name is #{@name}!"
#   end
# end

# 2 - Creating an invoking a getter method for @name

# class Cat
#   def initialize(name)
#     @name = name
#   end
  
#   def name
#     @name
#   end
  
#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

# 3 - using an accessor method as getter

class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet