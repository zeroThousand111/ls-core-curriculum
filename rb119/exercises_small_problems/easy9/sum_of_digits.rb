=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

INPUT: a postive integer

OUTPUT: another Integer

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a numerical string version of the input number
  a.Use #to_s
    i.input_number.to_s
2.MOVE through the numerical string value
  a.Could use loop, for, until etc, but challenge is to not use them
  b.Could use #each_char
    i.
3.CREATE a sum variable and set to zero
  a.
    i.
4.TRANSFORM each numerical string digit to an Integer and ADD it to the sum variable
  a.
    i.
5.RETURN the sum variable
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using #each_char

def sum(num)
  sum = 0
  num.to_s.each_char do |digit|
    sum += digit.to_i
  end
  sum
end

# -------------------

# solution 2 - refactor of above

def sum(num)
  sum = 0
  num.to_s.each_char { |digit| sum += digit.to_i }
  sum
end

# -------------------

# solution 3 - using # map and #inject

def sum(num)
  num.to_s.chars.map(&:to_i).inject(:+)
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
puts sum(23) # 5

# Test Cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45