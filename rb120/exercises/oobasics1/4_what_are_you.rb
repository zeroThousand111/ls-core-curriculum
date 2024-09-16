=begin
What Are You?
Using the code from the previous exercise, add an #initialize method that prints I'm a cat! when a new Cat object is instantiated.

Code:

class Cat
end

kitty = Cat.new

Expected output:

I'm a cat!
=end

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new