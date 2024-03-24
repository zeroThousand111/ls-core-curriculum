=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

INPUT: Three Integers

OUTPUT: A symbol

RULES
EXPLICIT REQUIREMENTS:
  - a valid triangle has the sum of the angles = 180 degrees && all angles > 0
  - :right - One angle of the triangle is a right angle (90 degrees)
  - :acute - All 3 angles of the triangle are less than 90 degrees
  - :obtuse - One angle is greater than 90 degrees.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

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

# solution 1 - first solution
def triangle(angle1, angle2, angle3)
  array_of_angles = [angle1, angle2, angle3]
  return :invalid if array_of_angles.sum != 180 || array_of_angles.any? { |angle| angle <= 0 }
  
  case 
  when array_of_angles.any? { |angle| angle == 90 }
    :right
  when array_of_angles.any? { |angle| angle > 90 }
    :obtuse
  when array_of_angles.all? { |angle| angle < 90 }
    :acute
  end
end
# -------------------

# solution 2 - combining valid triangle test into the case statement

def triangle(angle1, angle2, angle3)
  array_of_angles = [angle1, angle2, angle3]
  
  case 
  when array_of_angles.sum != 180 || array_of_angles.any? { |angle| angle <= 0 }
    :invalid
  when array_of_angles.any? { |angle| angle == 90 }
    :right
  when array_of_angles.any? { |angle| angle > 90 }
    :obtuse
  when array_of_angles.all? { |angle| angle < 90 }
    :acute
  end
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid