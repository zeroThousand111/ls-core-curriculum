=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

INPUT: An array

OUTPUT: An Array

RULES
EXPLICIT REQUIREMENTS:
  - You may not use Array#reverse or Array#reverse!.
  - mutate the Array passed into this method
  - The return value should be the same Array object.
  
IMPLICIT REQUIREMENTS:
  - Empty arrays are allowed input
  - Array elements may be of different types
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays, for sure!

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.SWAP outermost elements in the array
  a.
    i.array[0], array[-1] = array[-1], array[0]
2.SWAP next pair inside in the array
  a.
    i.array[1], array[-2] = array[-2], array[1]
3.CONTINUE UNTIL either a) all pairs swapped (even no of elements) OR b) one solo element left in the middle (odd no of elements), in which case stop there
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

def reverse!(array)
  index = 0
  neg_index = -1
  
  loop do 
    # binding.pry
    break if index == (array.size / 2) || array.size <= 1
    array[index], array[neg_index] = array[neg_index], array[index]
    index += 1
    neg_index -=1
  end
  
  # array
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true