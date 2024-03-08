=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

INPUT: a String 

OUTPUT: An array of strings

RULES
EXPLICIT REQUIREMENTS:
  - assume that words in the string are separated by exactly one space
  - any substring of non-space characters is a word
  -
  
IMPLICIT REQUIREMENTS:
  - empty string input == empty array return
  -
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
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an empty return array
  a.
    i.return_array = []
2.SPLIT the string into an array of words
  a.
    i.
3.COUNT the number of characters in EACH word
  a.
    i.
4.COPY the word and an appended numerical string count of characters as a string to the return array
  a.
    i.word_and_count = "#{word} #{word.size}"
5.RETURN the return array
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate through the array of words

def word_lengths(string)
  return_array = []
  return return_array if string.empty?
  array = string.split(' ')
  
  index = 0
  loop do
    return_array << "#{array[index]} #{array[index].length}"
    index += 1
    break if index == array.size
  end
  return_array
end

# -------------------

# solution 2 - using an UNTIL loop to iterate

def word_lengths(string)
  return_array = []
  return return_array if string.empty?
  array = string.split(' ')
  
  index = 0
  until index == array.size
    return_array << "#{array[index]} #{array[index].length}"
    index += 1
  end
  return_array
end

# -------------------

# solution 3 - using a FOR loop to iterate

def word_lengths(string)
  return_array = []
  return return_array if string.empty?
  array = string.split(' ')
  
  for word in array
    return_array << "#{word} #{word.length}"
  end
  return_array
end

# -------------------

# solution 4 - using #each

def word_lengths(string)
  return_array = []
  return return_array if string.empty?
  array = string.split(' ')
  array.each { |word| return_array << "#{word} #{word.length}" }
  return_array
end

# -------------------

# solution 5 - using #map

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

# -------------------

# solution 6 - using alternative string constructor

def word_lengths(string)
  string.split.map { |word| word + " " + word.length.to_s }
end

# -------------------

# Print Tests

# Test Cases

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []