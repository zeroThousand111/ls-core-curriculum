=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:


INPUT: an Array of string words

OUTPUT: multiple Arrays of string words that are anagrams

RULES
EXPLICIT REQUIREMENTS:
  - the same exact letters in them but in a different order
  - PRINTS out
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.MOVE through the input array, one word at a time
  a.simple loop
  b.#each
    i.
2.TAKE the next word and assign it to a local variable 
  a.
    i.target_word = 'word'
3.CREATE a return_array
4.MOVE through the WHOLE array of strings
  a.
    i.
5.COMPARE if the next word is an anagram of the target word
  a.an anagram could be detected by SORTing the target word alphabetically, and then comparing against each word that is also sorted
  b.if the target word and next word are the same, then ...
  c.IGNORE the target word itself during the search
    i.
6.COPY next word to output_array if it is an anagram
  a.
    i.
7.RETURN output_array or PRINT it
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# solution 1 - using simple loops

def anagrams(input_array)
  target_word_index = 0
  loop do
    output_array = []
    
    search_word_index = 0
    target_word = input_array[target_word_index]
    loop do 
      if target_word.split(//).sort == input_array[search_word_index].split(//).sort
        output_array << input_array[search_word_index]
      end
      search_word_index += 1
      break if search_word_index == input_array.size
    end
    
    p output_array
    
    target_word_index += 1
    break if target_word_index == input_array.size
  end
end

# -------------------

# solution 2 - using two nested FOR loops

def anagrams(input_array)
  for target_word in input_array do
    output_array = []
    for search_word in input_array do
      if target_word.split(//).sort == search_word.split(//).sort
        output_array << search_word
      end
    end
    p output_array
  end
end

# -------------------

# solution 3 - using two nested #each

def anagrams(input_array)
  input_array.each do |target_word|
    output_array = []
    input_array.each do |search_word|
      if target_word.split(//).sort == search_word.split(//).sort
        output_array << search_word
      end
    end
    p output_array
  end
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

anagrams(words)
# Test Cases