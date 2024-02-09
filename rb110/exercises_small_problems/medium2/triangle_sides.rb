=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A triangle is classified as follows:

- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

INPUT: Three Integers or Floats

OUTPUT: A symbol

RULES
EXPLICIT REQUIREMENTS:
  - A valid triangle is valid if the lengths of the two shortest sides are greater than the length of the longest side AND all sides must be greater than 0
  - 3 equal inputs is an equilateral triangle
  - 2 equal inputs (and one different) is an isoceles triangle
  - 3 unequal inputs is a scalene triangle
  
IMPLICIT REQUIREMENTS:
  - Are we dealing with Integers or Floats?  As some inputs are Floats, we have to deal with Floats
  - Always three inputs; no more, no less, even if input is zero
  - Return will be one of four symbols:
    - :invalid
    - :equilateral
    - :isosceles
    - :scalene

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE a new array containing three input values of FLOATS:
  a. Take parameters x, y & z and create an array of floats [x, y, z]
    i. triangle_array = [x.to_f, y.to_f, z.to_f]
2.SORT the array in ascending numerical value:
  a. Sort the array with a sorting method
    i. triangle_array.sort
3.TEST that the triangle is valid (if not valid RETURN :invalid):
  a. Check that all sides > 0?
    i. use Array#all? i.e. triangle_array.all? { |value| value > 0 }
  b. Sum values at triangle_array[0] and triangle_array[1] and check that the sum is greater than the value at triangle_array[2]
    i. (triangle_array[0] + triangle_array[1]) > triangle_array[2]
  c. If either of above does not return true, then return :invalid
4.IF the triangle is valid CATEGORISE type of triangle
  a. If triangle_array[0] == triangle_array[1]) == triangle_array[2] then return :equilateral
    i. if triangle_array[0] == triangle_array[1] && triangle_array[0] == triangle_array[2] && triangle_array[1] == triangle_array[2] return :equilateral
  b. If triangle_array[0] == triangle_array[1]) OR triangle_array == triangle_array[2] OR triange_array[1] == triangle_array[2] then return :isosceles
    i.  if  triangle_array[0] == triangle_array[1]) || triangle_array[0] == triangle_array[2] || triange_array[1] == triangle_array[2] then return :isosceles
    ii. Alternatively this can be the ELSE last statement of an IF statement
  c. If triangle_array[0] != triangle_array[1]) != triangle_array[2] != triangle_array[0] then return :scalene
    i. if triangle_array[0] != triangle_array[1] && triangle_array[0] != triangle_array[2] && triangle_array[1] != triangle_array[2] return :scalene
5.RETURN a symbol
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - My solution

def triangle(x, y, z)
  triangle_array = [x.to_f, y.to_f, z.to_f].sort!
  
  # test valid triangle
  return :invalid unless triangle_array.all? { |value| value > 0 } && (triangle_array[0] + triangle_array[1]) > triangle_array[2]
  
  # categorise triangle
  if triangle_array[0] == triangle_array[1] && triangle_array[0] == triangle_array[2] && triangle_array[1] == triangle_array[2]
    return :equilateral
  elsif triangle_array[0] != triangle_array[1] && triangle_array[0] != triangle_array[2] && triangle_array[1] != triangle_array[2]
    return :scalene
  else
    return :isosceles
  end
  
end

# -------------------

# solution 2 - Official LS Solution

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side >= sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

# -------------------

# Print Tests
# p triangle(3, 3, 1.5)

# Test Cases
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid