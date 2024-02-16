=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.


INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - cannot use String#to_i
  - cannot use Integer()
  - return is an Integer
  - Assume all characters will be numeric
  
IMPLICIT REQUIREMENTS:
  - strings may be of different lengths
  - positive numbers may have a leading '+' or no sign
  - negative numbers always have a leading '-' sign

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays to chop up the string and iterate on it
Hash for a conversion table between numeric strings and Integers

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.USE previous solution method to do the main job
  a.
    i.
2.DECIDE whether to return a positive or negative Integer
  a.A negative number always has a leading '-' (whereas a postive has either nothing or a '+' sign)
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

CONVERSION = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
}

# solution 1 - the smart ass one with #inject

# def string_to_signed_integer(string)
#   signless_string = string.gsub('+', '').gsub('-', '')
#   array_of_nums = signless_string.chars.map { |char| CONVERSION[char] }
  
#   sum = array_of_nums.each.inject { |memo, num| 10 * memo + num }
#   sum = -sum if string.start_with?('-')
#   sum
# end

# -------------------

# solution 2 - Offical LS Solution - uses former method and nice substring referencing

DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

# -------------------

# solution 3 - Further Exploration - I needed help from Student Solutions for this

def string_to_signed_integer(string)
  number = string_to_integer(string.delete('^0-9'))
  string[0] == '-' ? -number : number
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p string_to_signed_integer('4321') # 4321

# Test Cases
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100