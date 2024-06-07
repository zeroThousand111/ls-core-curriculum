=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

# UNDERSTAND THE PROBLEM

## Reframe or explain the problem

735291
352917 - first rotation - first digit (index 0) 7 now last digit
329175 - second rotation - second digit (index 1) 5 now last digit
321759 - third rotation - third digit (index 2) 9 now the last digit
321597 - fourth rotation - fourth digit (index 3) 7 now the last digit
321579 - fifth (and max) rotation - fifth digit (index 4) 9 now the last digit

## Input: an integer
## Output an integer that is the maximum rotation of the input integer
## Rules
### Explicit requirements:
  - a method
  - can use the rotate_rightmost_digits method from the previous exercise
  - 
### Implicit requirements:
  - return must be a new object, because its an integer
  - there will be number-of-digits - 1 rotations to get to the max rotation
  
# EXAMPLES

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

# DATA STRUCTURES
Arrays; an array of digits

# ALGORITHM

* SET UP rotate_rightmost_digits(integer, n) method
* INVOKE rotate_rightmost_digits method multiple times
  + n should start at and then descend by 1 on each iteration
  + integer should be reassigned to return from this method each time
* RETURN the integer after the number of digits minus one times invocations of helper method
=end

def rotate_rightmost_digits(integer, n)
  output_array = []
  array_of_numeric_digits = integer.to_s.chars
  array_of_numeric_digits.each { |char| output_array << char }
  moved_character = output_array.delete_at(-n)
  output_array << moved_character
  output_array.join.to_i
end

def max_rotation(integer)
  n = integer.digits.size
  until n == 1
    integer = rotate_rightmost_digits(integer, n)
    n -= 1
  end
  integer
end

def max_rotation(integer)
  integer.digits.size.downto(1) do |n|
    integer = rotate_rightmost_digits(integer, n)
  end
  integer
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845