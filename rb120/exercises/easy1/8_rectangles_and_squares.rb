=begin
Rectangles and Squares
Given the following class:

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

Write a class called Square that inherits from Rectangle, and is used like this:

square = Square.new(5)
puts "area of square = #{square.area}"
=end

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

# creating a bespoke `initialize` constructor method for square

# class Square < Rectangle
  
#   def initialize(value)
#     @height = value
#     @width = value
#   end
  
# end

# using `super` to borrow the superclass `initialize` constructor method in rectangle

class Square < Rectangle
  
  def initialize(value)
    super(value, value)
  end
  
end

square = Square.new(5)
puts "area of square = #{square.area}"