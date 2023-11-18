=begin

PROBLEM

In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

TEST CASES

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

UNDERSTANDING THE PROBLEM

INPUT: an Integer
OUTPUT: a String
REQUIREMENTS:
  EXPLICIT REQUIREMENTS:
  - Standard conversion methods are not allowed;
  - May use method used in previous exercise;
  - 
  IMPLICIT REQUIREMENTS:
  - All string results have a sign prefix, unless zero;
  - Input is always valid Integer;

DATA STRUCTURES
Input: Integer
Interim: String?
Output: String

ALGORITHM

1. Take input Integer;
2. IF number > 0
    - Send Integer to integer_to_string method;
    - Append a '+' to the front of the returned string;
3. IF number < 0
    - Send the absolute value of Integer to integer_to_string method i.e. Integer#abs method;
    - Append a '-' to the front of the returned string;
4. IF number == 0
    - assign the String to '0'
5. Return String.
=end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  if number > 0
    result = integer_to_string(number)
    result.prepend("+")
  elsif number < 0
    result = integer_to_string(number.abs)
    result.prepend("-")
  else
    result = '0'
  end
  result
end

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

# print tests
# p signed_integer_to_string(4321) # '+4321'
# p signed_integer_to_string(-123) # '-123'

# truth tests
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'