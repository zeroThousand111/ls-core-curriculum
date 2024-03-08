=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

INPUT: an Integer

OUTPUT: an Array

RULES
EXPLICIT REQUIREMENTS:
  - Array contains all Integers in sequence from 1 to the argument
  - Integer will always be a positive Integer
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREAT an empty array to return
  a.
    i.
2.CREATE the numbers from 1 to argument and copy them in turn to the new array
  a.
    i.
3.RETURN the array
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

# solution 1 - Using a simple loop 

def sequence(target)
  array = []
  num = 1
  loop do
    # binding.pry
    break if num > target
    array << num
    num += 1
  end
  p array
end

# -------------------

# solution 2 - using an UNTIL loop

def sequence(target)
  array = []
  num = 1
  until num > target
    array << num
    num += 1
  end
  p array
end

# -------------------

# solution 3 - using #upto

def sequence(target)
  array = []
  1.upto(target) { |num| array << num }
  array
end

# -------------------

# solution 4 - using #upto and #map

def sequence(target)
  1.upto(target).map { |num| num }
end

# -------------------

# solution 5 - FURTHER EXPLORATION - accepting negative arguments

def sequence(target)
  if target >= 1
    1.upto(target).map { |num| num }
  elsif target < 1
    1.downto(target).map { |num| num }
  end
end

# -------------------

# Print Tests

# Test Cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Test Cases - FURTHER EXPLORATION
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [1, 0, -1, -2, -3, -4, -5]