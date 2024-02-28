=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

INPUT: An Array and a search value

OUTPUT: A boolean

RULES
EXPLICIT REQUIREMENTS:
  - You may not use the Array#include? method
  -
  -
  
IMPLICIT REQUIREMENTS:
  - Empty arrays are allowed
  - nilClass objects are allowed as both types of argument
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

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


1.SAVE search value to a local variable
  a.
    i.
2.EXAMINE each element of array in turn
  a.Could use a simple loop
  b.Could use #each
    i.
3.COMPARE each element of array to search value
  a.
    i.
4.Return `true` if search value found
  a.
    i.
5.Return `false` in any other circumstance i.e. this is the default return
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using a simple loop

# def include?(array, search_value)
#   index = 0
#   loop do
#     break if index == array.size
#     return true if array[index] == search_value
#     index += 1
#   end
  
#   return false
# end

# -------------------

# solution 2 - using #each

def include?(array, search_value)
  array.each do |element|
    return true if element == search_value
  end
  
  return false
end

# -------------------

# solution 3 - using a FOR loop

def include?(array, search_value)
  for element in array
    return true if element == search_value
  end
  
  return false
end

# -------------------

# solution 4 - the official smart ass "easy" LS way, quite a lot like the prohibited Array#include?

def include?(array, value)
  !!array.find_index(value)
end



# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false