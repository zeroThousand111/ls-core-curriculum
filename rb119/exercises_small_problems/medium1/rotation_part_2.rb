=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that can rotate the last n digits of a number. For example:

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - rotating 1 digit results in the original number being returned
  - You may use the rotate_array method from the previous exercise if you want. (Recommended!)
  - You may assume that n is always a positive integer.
  
IMPLICIT REQUIREMENTS:
  - Another way of phrasing the method: it takes a subarray of the last n digits and then rotates that subarray and then puts it back at the end of the array
  - I'll assume the return is a NEW array
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings and Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a NEW output_array
  a.
    i.
2.TRANSFORM the input Integer into a String
  a. 
    i. input_num.to_s
2.COPY the first part of the input_array to the output_array
  a.Could use array element reference
  b.Could use #first
2.COPY the LAST n digits into a subarray
  a.Could use #last
  b.Could use array element reference
    i.
3.INVOKE helper method on subarray
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

def rotate_array(input_array)
  [input_array[1..-1], input_array[0]].flatten
end

def rotate_string(input_string)
  input_string[1..-1] + input_string[0]
end

# solution 1 - using #first and #last to create sub-arrays

def rotate_rightmost_digits(input_num, n)
  numeric_string = input_num.to_s
  first_sub_array = numeric_string.chars.first(numeric_string.length - n)
  last_sub_array = numeric_string.chars.last(n)
  [first_sub_array + rotate_array(last_sub_array)].join.to_i
end

# -------------------

# solution 2 - using #slice to create sub-strings

def rotate_rightmost_digits(input_num, n)
  numeric_string = input_num.to_s
  first_sub_string_length = numeric_string.length - n
  first_sub_string = numeric_string.slice(0, first_sub_string_length)
  last_sub_string = numeric_string.slice(first_sub_string_length, n)
  (first_sub_string + rotate_string(last_sub_string)).to_i
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917