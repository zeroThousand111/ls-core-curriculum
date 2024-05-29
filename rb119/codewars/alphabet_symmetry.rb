=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0

Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

INPUT: An array of strings

OUTPUT: An array of integers

RULES
EXPLICIT REQUIREMENTS:
  - Input will consist of alphabet characters, both uppercase and lowercase. No spaces.
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

solve(["abode","ABc","xyzD"]) = [4, 3, 1]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays and strings
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.Take EACH word, one at a time
  a.I could use Array#each
  b.I could use a simple loop
  c.I could use Array#map to directly return the answer to a new array of integers
    i.
2.CREATE an empty array of word counts
  a.
    i. array_of_word_counts = []
3.TRANSFORM word into downcased word to make solution simpler
  a.
    i.word.downcase
4.CREATE an array of alphabetical characters from a to z
  a.Use a range and then Range#to_a
    i.ALPHABET = ('a'..'z').to_a
5.For EACH word, iterate through the characters of the word
  a.Create sub-array of characters? OR
    i.word.chars
  b. 
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - My initial solution based on my PEDA

ALPHABET = ('a'..'z').to_a

def solve(array_of_words)
  array_of_word_counts = []
  array_of_words.each do |word|
    count = 0
    word.downcase.chars.each_with_index do |char, index|
      count += 1 if char == ALPHABET[index]
    end
    array_of_word_counts << count
  end
  array_of_word_counts
end

# -------------------

# solution 2 - Extracting the counting of each word to a different method

def count(word)
  count = 0
    word.downcase.chars.each_with_index do |char, index|
      count += 1 if char == ALPHABET[index]
    end
  count
end

def solve(array_of_words)
  array_of_word_counts = []
  array_of_words.each do |word|
    array_of_word_counts << count(word)
  end
  array_of_word_counts
end

# -------------------

# solution 3 - Using #map to tidy things up and be more direct

def count(word)
  count = 0
    word.downcase.chars.each_with_index do |char, index|
      count += 1 if char == ALPHABET[index]
    end
  count
end

def solve(array_of_words)
  array_of_words.map { |word| count(word) }
end

# -------------------

# solution 4 - New solution 28th May 2024

def solve(array_of_strings)
  alphabet_array = ('a'..'z').to_a
  array_of_counts = []
  array_of_strings.each do |word|
    count = 0
    word.chars.each_with_index do |char, index|
      count += 1 if alphabet_array.index(char.downcase) == index
    end
    array_of_counts << count
  end
  array_of_counts
end

# -------------------

# solution 5 - using #map instead of #each

def solve(array_of_strings)
  alphabet_array = ('a'..'z').to_a
  array_of_strings.map do |word|
    count = 0
    word.chars.each_with_index do |char, index|
      count += 1 if alphabet_array.index(char.downcase) == index
    end
    count
  end
end

# -------------------

# Print Tests

# Test Cases
p solve(["abode","ABc","xyzD"]) #== [4, 3, 1]