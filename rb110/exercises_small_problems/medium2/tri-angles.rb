=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A triangle is classified as follows:

- right One angle of the triangle is a right angle (90 degrees)
- acute All 3 angles of the triangle are less than 90 degrees
- obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

INPUT: Three integers

OUTPUT: A symbol

RULES
EXPLICIT REQUIREMENTS:
  - Values are Integers and always mean degrees °
  - Triangle must be valid:
    - the sum of angles must be exactly 180°, and
    - all angles must be greater than 0°
  - Right angled triangles have one angle that is 90°
  - Acute triangles have all 3 angles < 90°
  - Obtuse triangles have 1 angle > 90°
  
IMPLICIT REQUIREMENTS:
  - Always three Integers given as values
  - No returns other than a defined symbol (e.g. not `nil`)
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

1.CREATE an array made of the three values
  a. Assign each parameter to an element in the array
    i. array = [x, y, z]
2.TEST if the values in the array belong to a valid triangle
  a. the sum of the values must be 180, and
  b. each angle must be greater than 0
    i. array[0] + array[1] + array[2] == 180
  c. unless both a. and b. are true, return :invalid
3.CLASSIFY valid triangle into one of 3 categories
  a. 
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - My Solution

# def triangle(x, y, z)
#   array = [x, y, z]
#   return :invalid unless array[0] + array[1] + array[2] == 180
#   return :invalid unless array.select { |angle| angle > 0}.size == 3
  
#   case 
#   when array.any? { |angle| angle > 90 } then return :obtuse
#   when array.any?(90) then return :right
#   when array.all? { |angle| angle < 90 } then return :acute
#   end
# end

# -------------------

# solution 2 - LS Solution

# def triangle(angle1, angle2, angle3)
#   angles = [angle1, angle2, angle3]

#   case
#   when angles.reduce(:+) != 180, angles.include?(0)
#     :invalid
#   when angles.include?(90)
#     :right
#   when angles.all? { |angle| angle < 90 }
#     :acute
#   else
#     :obtuse
#   end
# end

# -------------------

# solution 3 - My Solution with multiple :invalid clauses included in case statement

def triangle(x, y, z)
  array = [x, y, z]
  case
  when array[0] + array[1] + array[2] != 180, array.select { |angle| angle > 0}.size != 3 then return :invalid
  when array.any? { |angle| angle > 90 } then return :obtuse
  when array.any?(90) then return :right
  when array.all? { |angle| angle < 90 } then return :acute
  end
end

# -------------------

# Print Tests
# p triangle(60, 70, 50) # :acute
# p triangle(30, 90, 60) # :right
# p triangle(120, 50, 10) # :obtuse

# Test Cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

p triangle(40, 80, 60) == :acute