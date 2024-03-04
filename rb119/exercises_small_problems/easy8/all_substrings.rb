=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

INPUT: a String

OUTPUT: an Array of substrings

RULES
EXPLICIT REQUIREMENTS:
  - return is an Array of all substrings
  - return in order of index start position then by length of substring
  - can and should use leading_substrings method from previous exercise
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an empty array of substrings to be returned
  a.
    i.
2.Starting with the substrings beginning with index[0], create a list of substrings
  a.use leading_substrings method already created
  b.pass whole string to leading_substrings method
    i.
3.Starting with the next character at index[1], create a list of substrings
  a.
    i.
4.Continue iterating UNTIL
  a.
    i.
5.FLATTEN the nested array structure into a single 1D list
  a.Array#flatten
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

def leading_substrings(string)
  string.chars.map.with_index { |char, index| string[0, index + 1] }
end

# solution 1 - using a simple loop

def substrings(string)
  array = []
  start_index = 0
  loop do
    array << leading_substrings(string.slice(start_index..-1))
    start_index += 1
    break if start_index == string.length
  end
  array.flatten
end

# -------------------

# solution 2 - using Integer#upto

def substrings(string)
  array = []
  0.upto(string.length) do |start_index|
    array << leading_substrings(string.slice(start_index..-1))
  end
  array.flatten
end

# -------------------

# solution 3 - variation of 2 using different methods to do the same

def substrings(string)
  array = []
  0.upto(string.length) do |start_index|
    array.push(leading_substrings(string[start_index..-1]))
  end
  array.flatten
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
pp substrings('abcde') # [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Test Cases
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]