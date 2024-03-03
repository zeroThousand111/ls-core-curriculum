=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

INPUT: Two arrays of Integers

OUTPUT: An array containing the product of every pair of numbers, sorted by increasing numerical value

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

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

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


1.Create a NEW Array
  a.
    i.output_array
2.MOVE through the indices of the FIRST argument array
  a.A simple loop
  b.#each
  c.a FOR loop
    i.
3.MOVE through the indices of the SECOND argument array
  a.A simple loop
  b.#each
  c.a FOR loop
    i.
4.Multiply the Integers at those indices and push to the new array
  a.
    i.
5.SORT the output array in numerical order
  a.
    i.
6.RETURN the output array
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using nested simple loops

# def multiply_all_pairs(arr1, arr2)
#   output_array = []
#   arr1_index = 0
#   loop do
#     arr2_index = 0
#     loop do
#       output_array << arr1[arr1_index] * arr2[arr2_index]
#       arr2_index += 1
#       break if arr2_index == arr2.size
#     end
#     arr1_index += 1
#     break if arr1_index == arr1.size
#   end
#   output_array.sort
# end

# -------------------

# solution 2 - using #each

def multiply_all_pairs(arr1, arr2)
  output_array = []
  
  arr1.each do |arr1_index|
    arr2.each do |arr2_index|
      output_array << arr1_index * arr2_index
    end
  end
  
  output_array.sort
end

# -------------------

# solution 3 - 

def multiply_all_pairs(arr1, arr2)
  
  
  
end

# -------------------

# solution 4 - being smart-ass with #product

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) # [2, 4, 4, 6, 8, 8, 12, 16]

# Test Cases
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]