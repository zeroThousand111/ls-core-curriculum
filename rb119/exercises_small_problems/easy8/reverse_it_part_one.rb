=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

INPUT: A string

OUTPUT: a NEW string, with the words in reverse order

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - must accept empty strings
  - must accept strings of just whitespace but reduce them to an empty string, which feels like a function of Array#join
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

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

# solution 1 - 

def reverse_sentence(string)
  array = []
  string.split(' ').each do |word|
    array.unshift(word)
  end
  array.join(' ')
end

# -------------------

# solution 2 - refactor above for one line

def reverse_sentence(string)
  array = []
  string.split(' ').each { |word| array.unshift(word) }
  array.join(' ')
end

# -------------------

# solution 3 - using reverse_each

def reverse_sentence(string)
  array = []
  string.split(' ').reverse_each { |word| array << word }
  array.join(' ')
end

# solution 4 - official LS solution

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

# -------------------

# Print Tests
puts reverse_sentence('Reverse these words') #'words these Reverse'

# Test Cases

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''