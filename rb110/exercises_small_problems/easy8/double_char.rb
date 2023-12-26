=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string, and returns a new string in which every character is doubled.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return is a NEW string (not a mutated string);
  -
  
IMPLICIT REQUIREMENTS:
  - Non-letters are also doubled;
  - An empty string is returned as an empty string.
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

An array of characters
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an empty return array;
2. Iterate through the string 'collection'
a. Push each character to the return array twice each;
3. Join and return the array.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - a simple loop

# def repeater(input_string)
#   return '' if input_string == ''
#   output = []
  
#   counter = 0
#   loop do 
#     output << input_string[counter]
#     output << input_string[counter]
#     counter += 1
#     break if counter == input_string.length
#   end
#   output.join
# end

# solution 2 - using #each on array of characters

# def repeater(input_string)
#   input_array = input_string.chars
#   output_array = []
  
#   input_array.each do |char|
#     output_array << (char * 2)
#   end
  
#   output_array.join
# end

# solution 3 - using #map on array of characters

def repeater(input_string)
  input_string.chars.map { |char| char * 2 }.join
end

# Print Tests
p repeater('Hello') # "HHeelllloo"

# Test Cases

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''