=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).


INPUT: A string

OUTPUT: The same string mutated

RULES
EXPLICIT REQUIREMENTS:
  - output string should have all non-alphabetic characters replaced by whitespace
  - if there are two or more non-alphabetic characters in a row, they should only be replaced by one space
  -
  
IMPLICIT REQUIREMENTS:
  - There is only one test case, so I could create some of my own
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

cleanup("---what's my +*& line?") == ' what s my line '

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Destructively remove non-alphabetic characters from the argument string (input string) passed into the method
  a.String#gsub! might be an appropriate method to remove and replace
  b.The regex for non-alphabetic characters would be `/[^A-Za-z]/`
    i.input_string.gsub!(/[^A-Za-z]/, ' ')
2.Destructively remove any instances of two or more whitespace characters from the string
  a.The String#squeeze! method can be very useful here with the right argument
  b.The argument to pass to #squeeze would be ' '
    i.input_string.squeeze!(' ')
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

# solution 1 - using #gsub! and #squeeze!

def cleanup(string)
  string.gsub!(/[^A-Za-z]/, ' ').squeeze!(' ')
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p cleanup("---what's my +*& line?") # ' what s my line '

# Test Cases
p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("34 what's my +*98 line   ") == ' what s my line '