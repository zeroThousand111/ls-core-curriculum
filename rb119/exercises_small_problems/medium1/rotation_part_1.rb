=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

INPUT: an Array

OUTPUT: a NEW Array

RULES
EXPLICIT REQUIREMENTS:
  - the original array should not be modified
  - Do not use the method Array#rotate or Array#rotate!
  -
  
IMPLICIT REQUIREMENTS:
  - the element at array[0] is moved to position array[-1]
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

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
2.PREPEND each element from the END of the input array to the new array
  a.Can't use #unshift aka #prepend because this will mutate the input array
  b.Could use <<
    i.
3.APPEND the first element of the input array to the new array
  a.Can't use #push because this will mutate the input array
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

# solution 1 - using a simple loop

def rotate_array(input_array)
  output_array = []
  
  index = 1
  
  loop do
    break if index == input_array.size
    output_array << input_array[index]
    index += 1
  end
  
  output_array << input_array[0]
  output_array
end

# -------------------

# solution 2 - using Array element reference

def rotate_array(input_array)
  [input_array[1..-1], input_array[0]].flatten
end

# -------------------

# solution 3 - FURTHER EXPLORATION - a String object instead

def rotate_string(input_string)
  input_string[1..-1] + input_string[0]
end

# -------------------

# solution 4 - FURTHER EXPLORATION - an Integer object instead

def rotate_integers(input_integer)
  numerical_string = input_integer.to_s.slice(1..-1) + input_integer.to_s.slice(0)
  numerical_string.to_i
end

# -------------------

# solution 5 - refactor above using string element reference instead of #slice

def rotate_integers(input_integer)
  numerical_string = input_integer.to_s[1..-1] + input_integer.to_s[0]
  numerical_string.to_i
end

# -------------------

# Print Tests
p rotate_array(['a', 'b', 'c']) # ['b', 'c', 'a']

# Test Cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Print Tests
p rotate_string("hello") #"elloh"
p rotate_integers(12345) # 23451

# Test Cases Further Exploration
p rotate_string("hello") == "elloh"
p rotate_integers(12345) == 23451