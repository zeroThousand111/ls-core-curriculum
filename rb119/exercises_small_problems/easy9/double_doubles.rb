=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

INPUT: an Integer

OUTPUT: an Integer

RULES
EXPLICIT REQUIREMENTS:
  - double numbers are NOT like numeric palindromes
  - check if input is a double number
  - if it is, return the same Integer,
  - if not, return the Integer that is double that value
  
IMPLICIT REQUIREMENTS:
  - a numeric double is always EVEN number of digits
  - 
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.

1.CHECK IF input is a double number
  a.need to turn Integer to a numeric string to check
    i.input.to_s
  b.a numerical string double will be 
2.RETURN input if not
3.RETURN double input if it is



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

# solution 1 - first attempt

def twice(input)
  numeric_string = input.to_s
  halfway_index = (numeric_string.length / 2) - 1
  
  if numeric_string.length.even? && numeric_string[0..halfway_index] == numeric_string[halfway_index + 1..-1]
    input 
  else
    input * 2
  end
end

# -------------------

# solution 2 - refactor above to remove long line

def twice(input)
  
  numeric_string = input.to_s
  halfway = (numeric_string.length / 2) - 1
  
  if numeric_string.length.odd? 
    input * 2
  elsif numeric_string[0..halfway] == numeric_string[halfway + 1..-1]
    input 
  else
    input * 2
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
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10