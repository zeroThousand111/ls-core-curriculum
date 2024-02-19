=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

INPUT: A string

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - You may assume that every word contains at least one letter
  - the string will always contain at least one word
  - You may also assume that each string contains nothing but words and spaces
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.SPLIT the string into words
  a.
    i.
2.SWAP the first and last letters in EACH word
  a.
    i.
3.JOIN the words back into a string
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

# solution 1 - Using multiple string element assignment to swap first and last letter of each word

def swap(string)
  array_of_words = string.split
  array_of_words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  array_of_words.join(' ')
end

# -------------------

# solution 2 - Refactor above to make it more smart ass

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end

# -------------------

# solution 3 - Official LS solution

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end


# -------------------

# solution 4 - Further Exploration

def swap_first_last_characters(a, b)
  a, b = b, a
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word[0], word[-1])
  end
  result.join(' ')
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p swap('Oh what a wonderful day it is')
# Test Cases
# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'