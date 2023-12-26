=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Takes one string;
  - Return is a NEW string;
  - The order of the words is reversed
  
IMPLICIT REQUIREMENTS:
  - An empty string returns the same;
  - A string of just whitespace returns an empty string.
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

An array of strings (words)
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Take input_string and chop it into words
2.
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using ruby methods I know

def reverse_sentence(string)
  string.split(" ").reverse.join(" ")
end


# Print Tests
puts reverse_sentence('Reverse these words') #'words these Reverse'

# Test Cases
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''