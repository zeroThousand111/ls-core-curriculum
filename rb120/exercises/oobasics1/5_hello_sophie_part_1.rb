=begin

Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)

Code:

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new('Sophie')

Expected output:

Copy Code
Hello! My name is Sophie!
=end

class Cat
  def initialize(name)
    @name = name
    puts "Hello!  I'm a cat called #{@name}!"
  end
end

kitty = Cat.new('Sophie')
