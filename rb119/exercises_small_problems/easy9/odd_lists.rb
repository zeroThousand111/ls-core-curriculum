=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

INPUT: An Array

OUTPUT: A NEW/SAME? Array with elements of only odd index numbers of input array

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

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

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

# solution 1 - selecting/filtering with #select

def oddities(input_array)
  input_array.select.with_index { |element, index| index.even? }
end

# -------------------

# solution 2 - FURTHER EXPLORATION using a simple loop

def oddities(input_array)
  index = 0
  evens = []
  odds = []
  
  loop do 
    if index.even?
      evens << input_array[index]
    else
      odds << input_array[index]
    end
    index += 1
    break if index == input_array.size
  end
  
  [evens, odds]
end

# -------------------

# solution 3 - FURTHER EXPLORATION

def oddities(input_array)
  evens = input_array.select.with_index { |element, index| index.even? }
  odds = input_array.select.with_index { |element, index| index.odd? }
  [evens, odds]
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []
# p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

# FURTHER EXPLORATION Test Cases
p oddities([2, 3, 4, 5, 6]) == [[2, 4, 6], [3, 5]]
p oddities([1, 2, 3, 4, 5, 6]) == [[1, 3, 5], [2, 4, 6]]
p oddities(['abc', 'def']) == [['abc'], ['def']]
p oddities([123]) == [[123],[]]
p oddities([]) == [[],[]]
p oddities([1, 2, 3, 4, 1]) == [[1, 3, 1], [2, 4]]