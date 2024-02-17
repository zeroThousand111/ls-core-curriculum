=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

INPUT: An Integer

OUTPUT: A numeric string

RULES
EXPLICIT REQUIREMENTS:
  - No standard conversion methods allowed;
  - Write an extension to the previous solution (not a new one from scratch)
  - Extension accounts for signed numbers
  
IMPLICIT REQUIREMENTS:
  - Positive numbers are those greater than zero
    - The numeric string will have a leading '+' sign
  - Negative numbers are those less than zero
    - The numeric string will have a leading '-' sign
  - Zero has neither sign as a numeric string

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

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

CONVERSION = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

def integer_to_string(integer)
  integer.digits.reverse.map { |digit| CONVERSION[digit] }.join
end

# solution 1 - Using Integer#abs to get absolute value to previous method

# def signed_integer_to_string(integer)
#   absolute_integer = integer.abs
#   string = integer_to_string(absolute_integer)
#   case 
#   when integer > 0 then string.prepend('+')
#   when integer < 0 then string.prepend('-')
#   else 
#     string
#   end
# end

# -------------------

# solution 2 - Using a syntactical way of turning negative Integers to postive

def signed_integer_to_string(integer)
  if integer < 0 
    absolute_integer = -integer
  else
    absolute_integer = integer
  end
  string = integer_to_string(absolute_integer)
  case 
  when integer > 0 then string.prepend('+')
  when integer < 0 then string.prepend('-')
  else 
    string
  end
end

# -------------------

# solution 3 - Official LS Solution (which might not work with my original method)

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

# -------------------

# Further Exploration - reduce number of calls to integer_to_string.  Not my solution but I understand the logic

def signed_integer_to_string(integer)
  if integer < 0
    sign = '-'
  elsif integer > 0
    sign = '+'
  else
    sign = ''
  end
  sign + integer_to_string(integer.abs)
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p signed_integer_to_string(4321) # '+4321'
p signed_integer_to_string(-123) # '-123'

# Test Cases
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'