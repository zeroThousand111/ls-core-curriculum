=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

INPUT: Two arrays

OUTPUT: One array, with duplicates removed

RULES
EXPLICIT REQUIREMENTS:
  - two arrays as arguments
  - one array as return
  - returned array should include all values in two arguments but duplicate values removed
  
IMPLICIT REQUIREMENTS:
  - test case uses integers, but presumably any type of element could be used
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

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

STRATEGY A - ADD ALL ELEMENTS THEN REMOVE DUPLICATES
1.CREATE new array
  a.
    i.new_array = []
2.ADD elements of first array to new array
  a.Could use #each and 
    i.
3.ADD elements of second array to new array
  a.
    i.
4.REMOVE any duplicate elements
  a.
    i.
5.RETURN new array
  a.
    i.new_array
    
STRATEGY B - ADD ONLY THOSE ELEMENTS NOT ALREADY IN THE NEW ARRAY
1.CREATE new array
  a.
    i.new_array = []
2.ADD elements of first array to new array UNLESS they are already in new array
  a.Could use #each and 
    i.
3.ADD elements of second array to new array UNLESS they are already in new array
  a.
    i.
4.RETURN new array
  a.
    i.new_array
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Strategy A - using simple loops and Array#uniq!

def merge(array1, array2)
  new_array = []
  
  index = 0
  loop do
    new_array << array1[index]
    index += 1
    break if index == array1.size
  end
  
  index = 0
  loop do
    new_array << array2[index]
    index += 1
    break if index == array2.size
  end
  
  new_array.uniq!
end

# -------------------

# solution 2 - Strategy A - using Array#each and Array#uniq!

def merge(array1, array2)
  new_array = []
  array1.each { |element| new_array << element }
  array2.each { |element| new_array << element }
  new_array.uniq!
end

# -------------------

# solution 3 - Strategy B - using simple loops and Array#include? to filter

def merge(array1, array2)
  new_array = []
  
  index = 0
  loop do
    new_array << array1[index] unless new_array.include?(array1[index])
    index += 1
    break if index == array1.size
  end
  
  index = 0
  loop do
    new_array << array2[index] unless new_array.include?(array2[index])
    index += 1
    break if index == array2.size
  end
  
  new_array
end

# -------------------

# solution 4 - Strategy B - #each and Array#include? to filter

def merge(array1, array2)
  new_array = []
  array1.each { |element| new_array << element unless new_array.include?(element)}
  array2.each { |element| new_array << element unless new_array.include?(element)}
  new_array
end
  


# -------------------

# solution 5 - 

# -------------------

# Print Tests
p merge([1, 3, 5], [3, 6, 9]) # [1, 3, 5, 6, 9]

# Test Cases
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]