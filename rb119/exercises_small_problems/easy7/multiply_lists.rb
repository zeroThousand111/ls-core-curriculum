=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

INPUT: Two arrays of integers

OUTPUT: One array of integers

RULES
EXPLICIT REQUIREMENTS:
  - NEW array contains elements that are products of elements of the same index from two argument arrays
  - You may assume that the arguments contain the same number of elements.
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

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


1.CREATE a new empty array
  a.
    i.
2.MOVE through the two arrays at the same index each
  a.
    i.
3.MULTIPLY the two integers at the same index of each input array and insert them at the same index into the new array
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

# solution 1 - using simple loop

def multiply_list(arr1, arr2)
  output_arr = []
  index = 0
  loop do
    output_arr << arr1[index] * arr2[index]
    index += 1
    break if index == arr1.size
  end
  output_arr
end

# -------------------

# solution 2 - iterate with #each

def multiply_list(arr1, arr2)
  output_arr = []
  
  arr1.each_with_index do |element, index|
    output_arr << element * arr2[index]
  end
  
  output_arr
end

# -------------------

# solution 3 - using #map with index

def multiply_list(arr1, arr2)
  arr1.map.with_index do |element, index|
    element * arr2[index]
  end
end

# -------------------

# solution 4 - FURTHER EXPLORATION using #zip but requires a chain with #map

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |(first, second)| first * second }
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p multiply_list([3, 5, 7], [9, 10, 11]) # [27, 50, 77]

# Test Cases
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]