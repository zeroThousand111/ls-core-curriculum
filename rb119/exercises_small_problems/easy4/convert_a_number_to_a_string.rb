=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

INPUT: An postive Integer or zero

OUTPUT: A numeric string

RULES
EXPLICIT REQUIREMENTS:
  - May not use standard conversion methods;
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays and strings
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.TRANSFORM Integer into an array of digits
  a.
    i.integer.digits.reverse
2.CONVERT each Integer into a new array of strings
  a.CREATE hash conversion 'table' i.e. the reverse of the previous string=>integer problems
    i.CONVERSION = {}
  b.CREATE an empty array of strings
    i. array_of_strings = []
  c. ITERATE through the array of digits
    i. simple loop; OR
    ii.Array#each
  d. Hash element reference for digit n and push to array of strings
    i. array_of_strings.push(CONVERSION[digit]); OR
    ii. array_of_strings << CONVERSION[digit]
3.JOIN array of strings
  a.
    i.array_of_strings.join
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

CONVERSION = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

# solution 1 - Using simple loops - hardcore!

# def integer_to_string(integer)
#   array_of_digits = integer.digits.reverse
  
#   array_of_strings =[]
#   index = 0
#   loop do
#     array_of_strings << CONVERSION[array_of_digits[index]]
#     index += 1
#     break if index == array_of_digits.size
#   end
  
#   array_of_strings.join
# end

# -------------------

# solution 2 - Using #each

# def integer_to_string(integer)
#   array_of_digits = integer.digits.reverse
  
#   array_of_strings =[]
  
#   array_of_digits.each do |digit|
#     array_of_strings.push(CONVERSION[digit])
#   end
  
#   array_of_strings.join
# end

# -------------------

# solution 3 - using #map and refactoring to a one-line smart ass answer

def integer_to_string(integer)
  integer.digits.reverse.map { |digit| CONVERSION[digit] }.join
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p integer_to_string(4321) #'4321'

# Test Cases
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'