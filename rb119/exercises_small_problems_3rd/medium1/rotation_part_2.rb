=begin
Write a method that can rotate the last n digits of a number. For example:

# UNDERSTAND THE PROBLEM

## Input: TWO integers, 
## Output: An integer, with digits reordered, if second argument is > 1
## Rules
### Explicit requirements:
  - A method
  - Digit at index -n is moved to index -1

### Implicit requirements:
  - The integer might be any number of digits long
  
# TEST CASES / EXAMPLES

rotate_rightmost_digits(735291, 1) == 735291 # no change
rotate_rightmost_digits(735291, 2) == 735219 # object at index -2 moved to -1
rotate_rightmost_digits(735291, 3) == 735912 # object at index -3 moved to -1
rotate_rightmost_digits(735291, 4) == 732915 # object at index -4 moved to -1 
rotate_rightmost_digits(735291, 5) == 752913 # object at index -5 moved to -1
rotate_rightmost_digits(735291, 6) == 352917 # object at index -6 moved to -1

# DATA STRUCTURES
Arrays - an array of digits created from the input integer

# ALGORITHM

* ASSIGN the two arguments to method local variables
  + integer and n
* TRANSFORM integer into an array of digits
  + use #digits, then reverse to original order with #reverse
    - integer.digits.reverse
  + OR use Integer#to_s then String#chars to create an array of numeric strings e.g. ["1", "7"]
* CREATE an empty output array
* MOVE through the input_array and SHOVEL all characters into the output array
* DELETE the character at -n and assign it to a local variable
* PUSH the removed character to index -1 in the output array
* TRANSFORM the output array into an integer
  + use String#join then String#to_i
* RETURN the output array
=end

# def rotate_array(input_array)
#   output_array = []
#   1.upto(input_array.size - 1) { |index| output_array << input_array[index] }
#   output_array << input_array[0]
# end

def rotate_rightmost_digits(integer, n)
  output_array = []
  array_of_numeric_digits = integer.to_s.chars
  array_of_numeric_digits.each { |char| output_array << char }
  moved_character = output_array.delete_at(-n)
  output_array << moved_character
  output_array.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917