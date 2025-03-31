=begin
# Problem

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

## Input: an object with three attributes (the length of each side)
## Output: one of three Strings, declaring if it is one of three trianges

## Rules:
### Explicit requirements:
  - Determine what kind of shape is input
  - To be a valid triangle, each side length must be greater than 0.
  - To be a valid triangle, the sum of the lengths of any two sides must be greater than the length of the remaining side.
  - An equilateral triangle has three sides of equal length.
  - An isosceles triangle has exactly two sides of the equal length.
  - A scalene triangle has three sides of unequal length (no two sides have equal length).
  - 
### Implicit requirements (many from test cases):
  - Must be OOP-based code;
  - Triangle class objects;
  - Triangle class has three instance variables; one for each length of side;
  - Triangle class must have a constructor method;
  - The determination method is called `Triangle#kind`;
  - The `#kind` method returns 'equilateral', 'isosceles', 'scalene';
  - Instantiating an "illegal" non-Triangle as a Triangle object will raise an `ArgumentError`;
  - Therefore, Triangle constructor method must have strict validation requirements and raise an ArgumentError if they aren't fulfilled so that no Triangle object is not a geometric triangle;
  - Lengths of triangles can be Integers OR Floats;
  - 

# Examples/Test Cases

See `triangles_tests.rb` file

# Data Structures

# Algorithm
* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'

class Triangle
  attr_reader :x_length, :y_length, :z_length

  def initialize(x, y, z) # can I refactor as an array of values?
    @x_length = x
    @y_length = y
    @z_length = z

    raise ArgumentError unless self.is_a_triangle? # validation
  end

  def kind # method to determine what kind of triangle; must return one of three strings
    if self.is_equilateral?
      'equilateral'
    elsif self.is_isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def is_a_triangle?
    # all lengths must be greater than zero
    return false unless x_length > 0 && y_length > 0 && z_length > 0

    # the sum of the lengths of any two sides must be greater than the length of the third side; this is true for ALL two sides
    return false unless test_all_sides
    true
  end

  def test_all_sides
    # refactor to test an array of values with `#each_cons(2)` or similar?
    side_sum_test(x_length, y_length, z_length) && 
    side_sum_test(y_length, z_length, x_length) && 
    side_sum_test(x_length, z_length, y_length)
  end

  def side_sum_test(side1, side2, side3)
    (side1 + side2) > side3
  end

  def is_equilateral?
    x_length == y_length && y_length == z_length
  end

  def two_sides_same?(side1, side2)
    side1 == side2
  end

  def is_isosceles?
    two_sides_same?(x_length, y_length) || 
    two_sides_same?(y_length, z_length) ||
    two_sides_same?(x_length, z_length)
  end

  # NB. #is_scalene? not required, because validation for is_triangle? already in constructor.  If its not equilateral, and not isosceles, but its a triangle must mean it is scalene.

end

# valid triangle tests

obj1 = Triangle.new(1, 1, 1)  # no ArgumentError
# obj2 = Triangle.new(1, 1, 0)  # raises ArgumentError
# p obj3 = Triangle.new(1, 1, 2)  # raises ArgumentError

puts Triangle.new(9, 9, 9).kind # equilateral
puts Triangle.new(3, 4, 3).kind # isosceles
puts Triangle.new(2, 3, 4).kind # scalene