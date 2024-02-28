=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

INPUT: An array

OUTPUT: An object

RULES
EXPLICIT REQUIREMENTS:
  - one value in the array occurs twice
  - every other value occurs exactly once
  - return the value that occurs exactly twice
  
IMPLICIT REQUIREMENTS:
  - the test cases happen to be Integers, but presumably other types of element are allowed too
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

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


1.CREATE a new array
  a.
    i.
2.EXAMINE each element of the new array to the input array in turn
  a.Could use a simple loop to iterate
  b.Could use an Until loop
  c.Could use #each
  d.Check if that element is already in the new_array
    i.
3.DECIDE what to do next.  Either:
  a.copy the next element of the input_array to the new_array; OR
  b.Return the duplicate value
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

# solution 1 - using simple loop and Array#include? and build a new_array

# def find_dup(input_array)
#   new_array = []
  
#   index = 0
#   loop do
#     if new_array.include?(input_array[index])
#       return input_array[index]
#     else
#       new_array << input_array[index]
#     end
#     index += 1
#     break if index == input_array.size
#   end
# end

# -------------------

# solution 2 - using #each and #include? to refactor solution 1

# def find_dup(input_array)
#   new_array = []
#   input_array.each do |element|
#     if new_array.include?(element)
#       return element
#     else
#       new_array << element
#     end
#   end
# end


# -------------------

# solution 3 - Different strategy, count number of occurences and return the element occuring twice

def find_dup(input_array)
  hash = Hash.new(0)
  # create hash of frequencies
  input_array.each do |element|
    hash[element] += 1
  end
  # return the key that has a value of 2
  hash.each do |k,v|
    return k if v == 2
  end
end


# -------------------

# solution 4 - official LS solution using unintroduced method Enumerable#find

# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p find_dup([1, 5, 3, 1]) # 1

# Test Cases
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73