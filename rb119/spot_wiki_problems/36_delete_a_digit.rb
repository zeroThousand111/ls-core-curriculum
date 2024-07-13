=begin
36. Delete a Digit
(​https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby​)
6 kyu
Task
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# PROBLEM
## INPUT: an integer
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - find and return the "maximal number"
  - delete exactly one digit from the input Integer
  - minimum value of input Integer is 10 and maximum is 1,000,000 i.e. between 2 and 7 digits
### Implicit requirements:
  - a "maximal number" is an integer with the largest value in a group of Integers
  - 
  
# EXAMPLES
Example
For n = 152, the output should be 52;
For n = 1001, the output should be 101. 
Input/Output

[input] integer n
Constraints: 10 ≤ n ≤ 1000000.
[output] an integer

# DATA STRUCTURES
Intermediate: an array of Integers created from all possible "subintegers"

# ALGORITHM
* CREATE an empty array_of_numbers
* COUNT the number of digits in the input integer and store as local variable
  + use #digits.size method chain
    - number_of_digits = input_integer.digits.size
* SHOVEL number_of_digits copies of numeric string equivalent of input integer into the array of numbers
  + use times
  + use #<<
  + use #to_s
    - number_of_digits.times { |_| array_of_numbers << input_integer.to_s }
* DELETE one digit from each numeric string from index 0 to index - 1
  * MOVE through the array of numeric strings from first to last
    + use #each_index
  * DELETE character at string[index]
      - string[index] = ""
* TRANSFORM each numeric string into an Integer
* RETURN the Integer with the largest value
  + use #max
  
=end

def delete_digit(input_integer)
  array_of_numeric_strings = []
  number_of_digits = input_integer.digits.size
  number_of_digits.times { |_| array_of_numeric_strings << input_integer.to_s }
  array_of_numeric_strings.each_with_index do |num_string, index|
    num_string[index] = ""
  end
  array_of_numeric_strings.map(&:to_i).max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1