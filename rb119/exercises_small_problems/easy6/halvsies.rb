=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

INPUT: one array

OUTPUT: two arrays (as a nested pair)

RULES
EXPLICIT REQUIREMENTS:
  - a method that takes one array argument
  - return is two arrays as a nested pair
  - array1 contains first half of the input array
  - array2 contains second half
  - if the input array has an odd number of elements, then the middle element should be the last element in array1
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

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


1.CREATE a nested array to be returned later
  a.
    i.return_array = [[],[]]
2.COUNT the number of elements in the input array
  a.
    i.input_array.size
3.CALCULATE the index number of input array that is halfway
  a.IF number of elements in input array is EVEN, then halfway index is (array.size / 2) + 1
  b.IF number of elements in input array is ODD, then halfway index is (array.size / 2)
4.ADD first half of elements to sub-array return_array[0]
  a.
    i.
5.ADD second half of elements to sub-array return_array[1]
  a.
    i.
6.RETURN nested array
  a.
    i.return_array
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using simple loops but can't deal with zero or 1 elements in input

def halvsies(input_array)
  return_array = [[],[]]
  if input_array.size == 1 then return_array[0][0] = input_array[0] end
  if input_array.empty? || input_array.size == 1 then return return_array end

  half_index = input_array.size.even? ? (input_array.size / 2) : (input_array.size / 2) + 1
  
  index = 0
  loop do
    return_array[0] << input_array[index]
    # binding.pry
    index += 1
    break if index == half_index
  end
  
  loop do
    return_array[1] << input_array[index]
    index += 1
    break if index == input_array.size
  end
  
  return_array
end

# -------------------

# solution 2 - Using two Until loops - no edge case returns needed!

def halvsies(input_array)
  return_array = [[],[]]

  half_index = input_array.size.even? ? (input_array.size / 2) : (input_array.size / 2) + 1
  
  index = 0
  until index == half_index
    return_array[0] << input_array[index]
    # binding.pry
    index += 1
  end
  
  until index == input_array.size
    return_array[1] << input_array[index]
    index += 1
  end
  
  return_array
end

# -------------------

# solution 3 - Using Integer#upto to create two index loops

def halvsies(input_array)
  return_array = [[],[]]

  half_index = input_array.size.even? ? (input_array.size / 2) : (input_array.size / 2) + 1
  
  0.upto(half_index - 1) do |index|
    return_array[0] << input_array[index]
  end
  
  (half_index).upto(input_array.size - 1) do |index|
    return_array[1] << input_array[index]
  end
  
  return_array
end

# -------------------

# solution 4 - Using Enumerable#partition

def halvsies(input_array)
  half_index = input_array.size.even? ? (input_array.size / 2) : (input_array.size / 2) + 1
  
  input_array.partition.with_index do |element, index|
    binding.pry
    index < half_index
  end
end

# -------------------

# solution 5 - Official LS Solution

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

# -------------------

# Print Tests
p halvsies([1, 2, 3, 4]) # [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # [[1, 5, 2], [4, 3]]
p halvsies([5]) # [[5], []]
p halvsies([]) # [[], []]

# Test Cases
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]