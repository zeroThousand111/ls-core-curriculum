=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

INPUT: An Integer

OUTPUT: An Integer, rotated to the max!

RULES
EXPLICIT REQUIREMENTS:
  - you do not have to handle multiple 0s
  - You can (and probably should) use the rotate_rightmost_digits method from the previous exercise
  -
  
Max Rotation is:
  - No is 735291
  - 352917 (rotate 7 from index 0 to index -1)
  - 329175 (rotate 5 from index 1 to index -1)
  - 321759 (rotate 9 from index 2 to index -1)
  - 321597 (rotate 7 from index 3 to index -1)
  - 321579 (rotate 9 from index 4 to index -1)
  
IMPLICIT REQUIREMENTS:
  - return is a new object (but has to be because of Ruby and immutable objects)
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

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


1.
  a.
    i.
2.
  a.
    i.
3.
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

# def rotate_array(input_array)
#   [input_array[1..-1], input_array[0]].flatten
# end

# def rotate_rightmost_digits(input_num, n)
#   numeric_string = input_num.to_s
#   first_sub_array = numeric_string.chars.first(numeric_string.length - n)
#   last_sub_array = numeric_string.chars.last(n)
#   [first_sub_array + rotate_array(last_sub_array)].join.to_i
# end

# def rotate_leftmost_digits(input_num, n)
#   array = input_num.to_s.chars
#   first_sub_array = numeric_string_array.first(n)
#   last_sub_array = numeric_string_array.last(array.size - n)
#   [first_sub_array + rotate_array(last_sub_array)].join.to_i
# end


# solution 1 - not using other helper methods from previous exercise

def max_rotation(num)
  array = num.to_s.chars
  
  index = 0
  loop do
    array << array.delete_at(index)
    index += 1
    break if index == num.to_s.length
  end
  array.join.to_i
end

# -------------------

# solution 2 - refactor of 1 using #each_with_index

def max_rotation(num)
  array = num.to_s.chars
  array.each_with_index do |element, index|
    array << array.delete_at(index)
  end
  array.join.to_i
end

# -------------------

# solution 3 - refactor of 1 smart-ass style

def max_rotation(num)
  array = num.to_s.chars
  array.each_with_index { |element, index| array << array.delete_at(index) }.join.to_i
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p max_rotation(35) # 53
p max_rotation(735291) # 321579

# Test Cases
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845