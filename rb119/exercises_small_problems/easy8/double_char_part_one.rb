=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string, and returns a new string in which every character is doubled.

INPUT: a String

OUTPUT:a NEW String

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - all characters are doubled, including whitespace
  - empty strings are allowed, but they are not 'doubled'
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Maybe arrays?
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a new string
  a.
    i.
2.MOVE through the input string
  a.
    i.
3.COPY two of each character of the input string to the new string
  a.
    i.
4.RETURN the new string
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

# solution 1 - using a simple loop to iterate

# def repeater(string)
#   double_string = ''
#   return double_string if string.empty?
  
#   index = 0
#   loop do
#     double_string << string[index] * 2
#     index += 1
#     break if index == string.length
#   end
#   double_string
# end

# -------------------

# solution 2 - using #each_char to iterate through 

# def repeater(string)
#   double_string = ''
#   return double_string if string.empty?
  
#   string.each_char { |char| double_string << char * 2 }
#   double_string
# end

# -------------------

# solution 3 - creating an array of characters then using #map and #join

def repeater(string)
  double_string = ''
  return double_string if string.empty?
  string.chars.map { |char| char * 2 }.join
end

# -------------------

# solution 4 - offical LS solution

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char # this doesn't cause problems with empty strings
  end
  result
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p repeater('Hello') # "HHeelllloo"

# Test Cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''