=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________



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

# solution 1 - using an if statement

def short_long_short(string1, string2)
  if string1.length > string2.length
    output_string = string2 + string1 + string2
  else
    output_string = string1 + string2 + string1
  end
  output_string
end

# -------------------

# solution 2 - using a case statement?

# def short_long_short(string1, string2)
#   case
#   when string1.length > string2.length then output_string = string2 + string1 + string2
#   when string1.length <= string2.length then output_string = string1 + string2 + string1
#   end
#   output_string
# end

# -------------------

# solution 3 - using a bad practice ternary operator

# def short_long_short(string1, string2)
#   string1.length > string2.length ? string2 + string1 + string2 : string1 + string2 + string1
# end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"