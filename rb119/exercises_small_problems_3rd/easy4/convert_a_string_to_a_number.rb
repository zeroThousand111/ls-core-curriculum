=begin
The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

# Understand the Problem

## Reframe the problem
Return an integer from a numeric string integer

## inputs: a numeric string
## outputs: an integer transformed from the numeric string

## Rules
### Explicit requirements:
  - return an integer transformed from the numeric string
  - may not use String#to_i
  - all integers are positive in this problem
### Implicit requirements:
  - none I can see so far
  

# Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

# Data Structures
Arrays for constructing new digit?
A hash of string to integer conversion

# Algorithm

* CREATE a hash of numeric strings to digit conversions
  + create it manually
  + create it programatically using a range of zero to 9, creating an array and then using #each_with_object on that array to make a hash
  + assign it to a CONSTANT to enable it to be used inside the method definition
* CREATE an output integer with a starting value of 0
* MOVE through the numeric string in REVERSE order, character by character
* ADD the digit paired with that numeric character to the output integer, starting at the digit place value, then tens place value, etc
* FINISH moving through the array
* RETURN the final sum of the output integer


Further Exploration
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

=end

require 'pry'
require 'pry-byebug'

# CHARACTER_TO_DIGIT_HASH = {
#   "0" => 0,
#   "1" => 1,
#   "2" => 2,
#   "3" => 3,
#   "4" => 4,
#   "5" => 5,
#   "6" => 6,
#   "7" => 7,
#   "8" => 8,
#   "9" => 9,
# }

digit_array = (0..9).to_a
CHARACTER_TO_DIGIT_HASH = digit_array.each_with_object({}) do |digit, hash|
  hash[digit.to_s] = digit
end

def string_to_integer(string)
  output_integer = 0
  multiplier = 1
  string.chars.reverse_each do |char|
    output_integer += CHARACTER_TO_DIGIT_HASH[char] * multiplier
    multiplier *= 10
  end
  output_integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# FURTHER EXPLORATION

CHARACTER_TO_DIGIT_HASH = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "a" => 10,
  "b" => 11,
  "c" => 12,
  "d" => 13,
  "e" => 14,
  "f" => 15,
}

def hexadecimal_to_integer(string)
  output_integer = 0
  multiplier = 1
  string.chars.reverse_each do |char|
    output_integer += CHARACTER_TO_DIGIT_HASH[char.downcase] * multiplier
    multiplier *= 16
  end
  output_integer
end

p hexadecimal_to_integer('4D9f') == 19871