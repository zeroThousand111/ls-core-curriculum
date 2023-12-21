=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return a string of the penultimate word;
  - A word is any sequence of non-blank characters;
  - The input string will always contain at least two words.
  
IMPLICIT REQUIREMENTS:
  - The problem is not case-sensitive;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Cut up string into words;
2.Isolate the penultimate word and return it
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end



# solution 1 - Array#split(" ")

def penultimate(input_string)
  array = input_string.split(" ")
  array[-2]
end

# Print Tests
p penultimate('last word') #'last'
p penultimate('Launch School is great!') #'is'

# Test Cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'