=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

INPUT: three separate Integers

OUTPUT: a symbol

RULES
EXPLICIT REQUIREMENTS:
  - to be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0
  - :equilateral == all 3 sides are of equal length
  - :isosceles == 2 sides are of equal length, while the 3rd is different
  - :scalene == all 3 sides are of different length
  
IMPLICIT REQUIREMENTS:
  - 
  - When comparing the value of all three integers there are ONLY going to be three possible outcomes:
    1.All values are different (:scalene)
    2.Two values are the same (:isosceles)
    3.All values are the same (:equilateral)
  -
  -

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

A sorted array to determine if it is a valid triangle
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - 

def triangle(length1, length2, length3)
  # a valid triangle?
  sorted_array = [length1, length2, length3].sort
  return :invalid if (sorted_array[0] + sorted_array[1]) < sorted_array[2]
  return :invalid if sorted_array.any? { |length| length <= 0 } 
  # valid triangle, but which?
  if length1 == length2 && length2 == length3
    :equilateral
  elsif length1 == length2 || length2 == length3 || length1 == length3
    :isosceles
  else
    :scalene
  end
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
