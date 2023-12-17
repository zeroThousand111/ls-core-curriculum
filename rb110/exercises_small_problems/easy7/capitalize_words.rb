=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

INPUT: A String

OUTPUT: A NEW String

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return a NEW string;
  - First character of every word capitalised, but all others lowercase;
  - Words are any sequence of non-blank characters.
  
IMPLICIT REQUIREMENTS:
  - 
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

String input.  String output.  Array of words interim.
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Split input string into array of words (#split);
2. Create new blank array;
2. For each word of input string, copy in the new array but capitalise first letter and make all others lowercase (String#capitalise)
3. For each word
4.
5. Join words back into string with spaces delineating each word. (#join(' '))
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - build new string by iterating through each word

# def word_cap(input_string)
#   array_of_words = input_string.split
#   new_array = []
#   array_of_words.each do |word|
#     new_array << word.capitalize
#   end
#   new_array.join(' ')
# end

# solution 2 - using #map

def word_cap(input_string)
  input_string.split.map { |word| word.capitalize }.join(' ')
end

# solution 3 - official LS solution using abbreviation

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# FURTHER EXPLORATION

# Ruby conveniently provides the String#capitalize method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.


# Print Tests
p word_cap('the javaScript language') # 'The Javascript Language'

# Test Cases

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'