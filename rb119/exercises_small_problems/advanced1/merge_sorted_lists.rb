=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

INPUT: Two arrays of Integers, both with their Integer elements sorted in numerical order

OUTPUT: One array of Integers, with the contents of the input in numerical order

RULES
EXPLICIT REQUIREMENTS:
  - The method should return a NEW array and not mutate the original arrays
  - You may not provide any solution that requires you to sort the result array
  - You must build the result array one element at a time in the proper order
  - Input arrays will always have their elements in numerical order
  
IMPLICIT REQUIREMENTS:
  - Input array might be empty
  - Input arrays may be of different sizes
  - Integers appear to only be 1 through to 9, not higher or lower

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

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


1.CREATE output array
  a.
    i. output = []
2.MOVE through both arrays somehow
  a. One way would be to provide a reference index counter that works on both arrays
  b. #each iteration would need to be on one of the arrays only, perhaps each array in turn, but that wouldn't help ordering
  c.CREATE TWO index counters, one for array1 and one for array2
    i.
3.COMPARE first element of array1 with first element of array2
  a.Use an IF statement structure
  b.The lower value integer is selected
  c.But what about `nil` values?  They can't be compared!!
    i.
4.ADD the lower value integer to the output matrix
  a.
    i.
5.INCREMENT the index counter of the array who supplied the Integer by 1
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# FAILED solution 1 - using a reference index counter from zero to nine, but doesn't work for input arrays containing more than one Integer of the same value

# def merge(array1, array2)
#   output_array = []
#   index_counter = 0
  
#   loop do
#     # binding.pry
#     output_array << index_counter if array1.include?(index_counter)
#     output_array << index_counter if array2.include?(index_counter)
#     index_counter += 1
#     break if index_counter == 10
#   end
  
#   output_array
# end

# -------------------

# FAILED solution 2 - Using two independent index counters to move through arrays BUT CAN'T COMPARE INTEGERS WITH NIL VALUES!

def merge(array1, array2)
  output_array = []
  array1_counter = 0
  array2_counter = 0
  
  loop do
    # binding.pry
    if array1[array1_counter] >= array2[array2_counter]
      output_array << array2[array2_counter]
      array2_counter += 1
    elsif array2[array2_counter] > array1[array1_counter]
      output_array << array1[array1_counter]
      array1_counter += 1
    end
    
    break if array1_counter == array1.size && array2_counter == array2.size
  end
  
  output_array
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p merge([1, 5, 9], [2, 6, 8]) # [1, 2, 5, 6, 8, 9]

# Test Cases
# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]