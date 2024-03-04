=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

INPUT: A string

OUTPUT: An array of strings

RULES
EXPLICIT REQUIREMENTS:
  - the array should have substrings in order from shortest to longest
  -
  -
  
IMPLICIT REQUIREMENTS:
  - the total substrings are only leading substrings that start with the first letter of the string, not all possible substrings that start with subsequent letters in the string
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an empty return array
  a.
    i.
2.MOVE through the input string
  a.use a simple loop
  b.turn the input array into an array of characters and then use #each
    i. #split.each or
    ii.#each_char
3.CREATE the first substring and MOVE it to the return array
  a.
    i.
4.CREATE the next substring and MOVE it to the return array
  a.
    i.
5.STOP when
  a.
    i.
6.RETURN the completed array of substrings
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate through the string and using an accumulator temporary substring variable

# def leading_substrings(string)
#   array = []
#   index = 0
#   substring = ''
#   loop do 
#     substring += string[index] #concatenating 
#     array << substring
#     index += 1
#     break if index == string.length
#   end
  
#   array
# end

# -------------------

# solution 2 - turning string to array first then using #map for the accumulator

def leading_substrings(string)
  input_array = string.split(//)
  substring = ''
  input_array.map do |char|
    substring += char
    substring
  end
end

# -------------------

# solution 3 - different algorithm, using String#slice to create substrings

def leading_substrings(string)
  array = []
  length = 1
  substring = ''
  
  loop do 
    substring = string[0, length]
    array << substring
    length += 1
    break if length == string.length + 1
  end
  
  array
end

# -------------------

# solution 4 - as solution 3 but using #each_with_index

def leading_substrings(string)
  array = []
  input_array = string.chars
  
  input_array.each_with_index do |char, index|
    array << string[0, index + 1]
  end
  
  array
end

# -------------------

# solution 5 - as solution 3 but using #map.with_index chain

def leading_substrings(string)
  input_array = string.chars
  input_array.map.with_index { |char, index| string[0, index + 1] }
end

# -------------------

# solution 6 - as solution 5 but refactor to smart-ass one liner

def leading_substrings(string)
  string.chars.map.with_index { |char, index| string[0, index + 1] }
end

# -------------------

# Print Tests
p leading_substrings('abc') # ['a', 'ab', 'abc']
# p leading_substrings('a') # ['a']
# p leading_substrings('xyzzy') # ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# # Test Cases
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']