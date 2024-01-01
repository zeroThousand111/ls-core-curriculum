=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

INPUT: A string

OUTPUT: An Array of strings

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Returns an array that contains every word from the input string plus one space and the numerical string of the word length;
  - Words are separated by exactly one space;
  - Any substring of non-space characters is not a word.
  
IMPLICIT REQUIREMENTS:
  - Input may be an empty string
  - Inference is that the return is a new string
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays.  Strings.

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an array of word strings (Array#split(" "))
2.Create an empty output_array
3.Iterate through the input_array
  a. Create a new string based on the element + " " + string.size
  b. Add new string to new array
4.Return output_array
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use a simple loop 

# def word_lengths(input_string)
#   input_array = input_string.split
#   output_array = []
#   return output_array if input_array.empty?
  
#   counter = 0
#   loop do
#     new_string = input_array[counter]
#     output_array << "#{new_string} #{new_string.length}"
#     counter += 1
#     break if counter == input_array.size
#   end
  
#   output_array
# end

# -------------------

# solution 2 - use Array#each

# def word_lengths(input_string)
#   input_array = input_string.split
#   output_array = []
#   return output_array if input_array.empty?
  
#   input_array.each do |word|
#     output_array << "#{word} #{word.length}"
#   end
 
#   output_array
# end

# -------------------

# solution 3 - use #map

def word_lengths(input_string)
  input_string.split.map { |word| "#{word} #{word.length}" }
end

# Print Tests

# Test Cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []