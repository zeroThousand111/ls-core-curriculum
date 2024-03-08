=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

INPUT: two Integers, the first a count, the second the start

OUTPUT: an Array

 - the same number of elements as count argument value
 - the next element will be a multiple of previous
 - in other words, the return is an array of integers, a sequence starting at the second argument value and incrementing (or decrementing in the case of negative value) in multiples of that value a number of times equal to the first argument value.

RULES
EXPLICIT REQUIREMENTS:
  - count argument will always be a positive Integer
  - starting argument can be any Integer
  - if count is zero, return empty array
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE return array with first element as second argument value
  a.
    i.e.g. array = [int2]
2.REPEAT the same number of times as the first argument
  a.Use Integer#times
    i.int1.times do...
3.CREATE more elements and copy them to the return array
  a.the next element is the last element + int2
    i.
4.RETURN the array
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

# solution 1 - using #upto

def sequence(int1, int2)
  array = []
  1.upto(int1) { |num| array << int2 * num }
  array
end

# -------------------

# solution 2 - using #map and a range

def sequence(int1, int2)
  (1..int1).map { |num| int2 * num }
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p sequence(5, 1) # [1, 2, 3, 4, 5]
p sequence(0, 1000000) # []

# Test Cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []