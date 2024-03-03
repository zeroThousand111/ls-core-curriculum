=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

FURTHER EXPLORATION

Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - Words are any sequence of non-blank characters.
  - You may assume that the input String will always contain at least two words.
  -
  
IMPLICIT REQUIREMENTS:
  -
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

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.SPLIT the string into an array of strings aka 'words'
  a.
    i. array = string.split
2.Return the string at array[-2]
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

# solution 1 - Main problem

def penultimate(string)
  array = string.split
  array[-2]
end

# -------------------

# solution 2 - FE with edge cases for main problem

def penultimate(string)
  array = string.split
  if array.size < 2
    array[0]
  else
    array[-2]
  end
end

# -------------------

# solution 3 - 

def middle(string)
  array = string.split
  # binding.pry
  half_index = (array.size / 2)
  array[half_index]
end


# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p penultimate('Launch School is great!') # 'is'

# Test Cases
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# FURTHER EXPLORATION
# Print Tests
# p penultimate('') # nil
# p penultimate('one') # 'one'
# p penultimate('Launch School is great!') # 'is'


# Test Cases - Find Middle Word
p middle('') # nil
p middle('one') # 'one'
p middle('Launch School is great!') # 'is'
p middle('Launch School is great!') == 'is'
p middle('one two three four five') == 'three'
p middle('one two three four five six seven') == 'four'