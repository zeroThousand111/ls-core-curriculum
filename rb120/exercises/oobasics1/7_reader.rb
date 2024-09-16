=begin
Reader
Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

Code:

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

Expected output:

Hello! My name is Sophie!
=end

# 1 - using full getter method

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

# 2 - using attr_reader to create a getter method for @name

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
puts kitty.name # => Sophie