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
  - There are no zeroes 0
  - Input arrays are already in numerical order, not random order
  - Arrays can contain MULTIPLES of the same value!  How to handle this?

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

COMPARISON WITH TWO INDEPENDENT INCREMENTING INDEXES

- CREATE result array
- CREATE an index number for array1
- CREATE an index number for array2
- MOVE through both arrays in a simple loop
- COMPARE array1[index1] with array2[index2]
- ACT
  - IF array1[index1] < array2[index2]
    - add array1[index1] to result array
    - increment index1 by 1
  - IF array1[index1] > array2[index2]; 
    - add array2[index2] to result array
    - increment index2 by 1
  - IF array1[index1] == array2[index2];
    - add array1[index1] AND array2[index2] to result array
    - increment index1 AND index2
  - IF array1[index1] == nil
    - add array2[index2] to result array
    - increment index2 by 1
  - IF array2[index2] == nil
    - add array1[index1] to result array
    - increment index1 by 1
  - ELSE (where both array1[index1] == nil && array2[index2] == nil)
    - break from the loop
- REPEAT until break condition;
  - index1 >= array1.size && index2 >= array2.size
- RETURN result array

______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'


# solution 5 - COMPARISON WITH TWO INDEPENDENT INCREMENTING INDEXES 05/05/2024

def merge(array1, array2)
  result = []
  index1 = 0
  index2 = 0
  
  loop do
    # binding.pry
    if array1[index1] == nil
      result << array2[index2]
      index2 += 1
    elsif array2[index2] == nil
      result << array1[index1]
      index1 += 1 
    elsif array1[index1] < array2[index2]
      result << array1[index1]
      index1 += 1
    elsif array1[index1] > array2[index2]
      result << array2[index2]
      index2 += 1
    elsif array1[index1] == array2[index2]
      result << array1[index1]
      result << array2[index2]
      index1 += 1
      index2 += 1
    end
    
    # break if index1 >= array1.size && index2 >= array2.size
    break if array1[index1] == nil && array2[index2] == nil
  end
  
  result
end

# -------------------

# Print Tests
p merge([1, 5, 9], [2, 6, 8]) # [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) # [1, 1, 2, 2, 3] - this is a challenging test case!

# Test Cases
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]