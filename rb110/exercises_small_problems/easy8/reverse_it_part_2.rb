=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.


INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Returns a new string or mutates the existing?
  - Reverse words that contain 5 or more (>= 5) letters
  - Strings will only be letters and spaces, and spaces only between words
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Chop the input_string into an array words, in other words at the spaces;
2. Iterate through the array of words;
a. Measure each word;
b. IF a word is 5 or more letters long, invoke String#reverse! on it
3. Join the array of words together and return it
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use a simple loop

# def reverse_words(input_string)
#   array = input_string.split
  
#   counter = 0
#   loop do 
#     if array[counter].size >= 5
#       array[counter].reverse!
#     end
#     counter += 1
#     break if counter == array.size
#   end
  
#   array.join(' ')
# end

# solution 2 - use #each

# def reverse_words(input_string)
#   array = input_string.split
  
#   array.each do |word|
#     if word.size >= 5
#       word.reverse!
#     end
#   end
  
#   array.join(' ')
# end

# solution 3 - use #map

# def reverse_words(input_string)
#   input_string.split.map do |word|
#     if word.size >= 5
#       word.reverse
#     else
#       word
#     end
#   end.join(' ')
# end

# solution 4 - use #map and a ternary

def reverse_words(input_string)
  input_string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

# Print Tests

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Test Cases

p reverse_words('Professional') == 'lanoisseforP'
p reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
p reverse_words('Launch School') == 'hcnuaL loohcS'