=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

INPUT: A string of characters

OUTPUT: An Array of every possible substring in order of length

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return a list of all substrings that start at the beginning of the string;
  - The return value should be arranged in order from shortest to longest substring.
  
IMPLICIT REQUIREMENTS:
  - No capitals;
  - No empty strings
  - One-character strings possible;

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty list
2.Iterate through the input_string
  a. Add the substring ending with that character to the end of the list;
  b. Continue until the last substring is the whole string.
3.Return the list of all substrings

______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - a simple loop

# def leading_substrings(input_string)
#   array = []
#   counter = 1
  
#   loop do
#     array << input_string.slice(0, counter)
#     counter += 1
#     break if counter == input_string.length + 1
#   end
#   array
# end

# solution 2 - #each

# def leading_substrings(input_string)
#   array = []
#   input_array = input_string.chars
#   input_array.each_with_index do |char, index|
#     array << input_string.slice(0, index + 1)
#   end
#   array
# end

# solution 3 - #map 
# def leading_substrings(input_string)
#   input_string.chars.map.with_index do | char, index |
#     input_string.slice(0, index + 1)
#   end
# end

# solution 4 - official LS solution - simple and neat!

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

# Print Tests
p leading_substrings('abc') # ['a', 'ab', 'abc']

# Test Cases
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']