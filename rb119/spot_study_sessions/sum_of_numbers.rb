=begin
Implement a function that calculates the sum of numbers inside of a string.

You can expect that the string will include only positive numbers.

sum_of_numbers("L12aun3ch Sch3oo451") = 469

sum_of_numbers("HE2LL3O W1OR5LD") == 11

sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

# UNDERSTAND THE PROBLEM

## INPUT
## OUTPUT
## RULES
### Explicit requirements:
- a method;
- calculate the sum of numbers inside a String
- the string will contain only positive sum_of_numbers

### Implicit requirements:
- "numbers" are numeric strings e.g. "2"
- some numbers are made of more than one digit

# EXAMPLES

sum_of_numbers("L12aun3ch Sch3oo451") = 469 # i.e. 12 + 3 + 3 + 451
sum_of_numbers("HE2LL3O W1OR5LD") == 11
sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635

# DATA STRUCTURES
An array of numeric strings or integers

# ALGORITHM

* CREATE an empty array for storing found numeric strings
    - numbers = []
* MOVE through the input string, character by character from first to last
  + transform to an array of single characters
  + use #chars
  + move using each_with_index
* CREATE a temp local variable to "catch" numeric strings with more than one digit
* DETERMINE IF the current char is a numeric string AND if the next character is a numeric string AND if current char is at the last index
  + use current char and char with index + 1
* ACT upon the determination above
  + IF the character is NOT a numeric string, move on, do nothing
  + IF the character is the last index AND is a numeric string
    + SHOVEL digit to temp
    + TRANSFORM temp to an Integer and SHOVEL temp to numbers array
  + IF the character IS a numeric string, AND this next string IS NOT a numeric   string, then:
    + SHOVEL digit to temp
    + TRANSFORM temp to an Integer
    + RESET temp to empty string value
  + IF the character IS a numeric string AND the next string IS also a numeric string, SHOVEL digit to temp, but don't do anything else
* STOP moving through the input string when the last character is reached
* SUM the Integers in the numbers Array
* RETURN the sum
=end

require 'pry'
require 'pry-byebug'

def sum_of_numbers(string)
  numbers = []
  multi_digit_num_string = ''
  array_of_chars = string.chars
  array_of_chars.each_with_index do |char, index|
  
    if index == (array_of_chars.size - 1) && char.match?(/[0-9]/)
      multi_digit_num_string << char
      numbers << multi_digit_num_string.to_i
    elsif char.match?(/[0-9]/) && array_of_chars[index + 1].match?(/[0-9]/)
      multi_digit_num_string << char
    elsif char.match?(/[0-9]/) && !array_of_chars[index + 1].match?(/[0-9]/)
      multi_digit_num_string << char
      numbers << multi_digit_num_string.to_i
      multi_digit_num_string = ''
    end
  end
  
  numbers.sum
end

# test cases

p sum_of_numbers("L12aun3ch Sch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635