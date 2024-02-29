=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

INPUT: Two arrays

OUTPUT: One NEW array

RULES
EXPLICIT REQUIREMENTS:
  - New array to contain all elements of both argument arrays
  - Elements in new array alternate sources between argument arrays
  - Assume both arrays are not empty and contain the same number of elements
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE new empty array 
  a.
    i.
2.COPY first element from first array to new array
  a.
    i.
3.COPY first element from second array to new array
  a.
    i.
4.CONTINUE with each element of both arrays UNTIL all elements have been copied into the new array
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

def interleave(array1, array2)
  new_array = []
  
  index = 0
  loop do 
    new_array << array1[index]
    new_array << array2[index]
    index += 1
    break if index == array1.size
  end
  new_array
end

# -------------------

# solution 2 - using each_index


def interleave(array1, array2)
  new_array = []
  
  array1.each_index do |index|
    new_array << array1[index]
    new_array << array2[index]
  end
  
  new_array
end

# -------------------

# solution 3 - using Integer#times

def interleave(array1, array2)
  new_array = []
  
  array1.size.times do |n|
    new_array << array1[n]
    new_array << array2[n]
  end
  
  new_array
end

# -------------------

# solution 4 - Using Integer#upto

def interleave(array1, array2)
  new_array = []
  
  0.upto(array1.size - 1) do |n|
    # binding.pry
    new_array << array1[n]
    new_array << array2[n]
  end
  
  new_array
end

# -------------------

# solution 5 - Using two shovel operators on the same line

def interleave(array1, array2)
  new_array = []
  
  index = 0
  loop do 
    new_array << array1[index] << array2[index]
    index += 1
    break if index == array1.size
  end
  new_array
end

# -------------------

# solution 6 - FURTHER EXPLORATION Using Array#zip

def interleave(array1, array2)
  new_array = []
  nested_array = array1.zip(array2)
  nested_array.each do |subarray|
    subarray.each do |element|
      new_array << element
    end
  end
  new_array
end

# solution 6 - FURTHER EXPLORATION Using Array#zip and Array#flatten

def interleave(array1, array2)
 array1.zip(array2).flatten
end

# -------------------

# Print Tests
p interleave([1, 2, 3], ['a', 'b', 'c']) # [1, 'a', 2, 'b', 3, 'c']

# Test Cases
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']