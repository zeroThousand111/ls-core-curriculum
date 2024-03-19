=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

INPUT: A text file

OUTPUT: A string containing the contents of the longest sentence and how many words it contains.

RULES
EXPLICIT REQUIREMENTS:
  - READ a text file
  - Print output: A string containing the contents of the longest sentence and how many words it contains.
  - A word is any sequence of characters that are not spaces or sentence-ending characters should be treated as a word
  - Sentences may end with periods (.), exclamation points (!), or question marks (?)
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

Example text = 86 words long
Frankenstein = is 157 words long.

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.OPEN the text file
  a.
    i.
2.READ the contents of the text file
  a.
    i.
3.SPLIT the strings in the text file into sentences
  a.
    i.
    
4.CREATE a max variable 
5.MEASURE the length of the substrings (each sentence)
  a.
    i.
6.IF the length of the next substring is greater than the max variable, reassign that value to the max variable
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using my own logic | Sorting an array of sentences in size order with the longest sentence shuffled to last position

def longest_sentence(file)
  file = File.open(file)
  all_text = file.read
  array_of_sentences = all_text.split(/\.|\?|!/)
  
  sorted_by_length = array_of_sentences.sort_by do |sentence|
    sentence.split(' ').size
  end
  
  puts sentence_length = sorted_by_length[-1].split(" ").length
  puts sentence = sorted_by_length[-1]
end

# -------------------

# solution 2 - refactor of above to tidy it and make it more concise

def longest_sentence(file)
  array_of_sentences = File.open(file).read.split(/\.|\?|!/)
  
  sorted_by_length = array_of_sentences.sort_by do |sentence|
    sentence.split(' ').size
  end
  
  puts sentence_length = sorted_by_length[-1].split(" ").length
  puts sentence = sorted_by_length[-1]
end

# -------------------

# solution 3 - Using Enumerable#max_by

def longest_sentence(file)
  array_of_sentences = File.open(file).read.split(/\.|\?|!/)
  
  sentence = array_of_sentences.max_by { |sentence| sentence.split(" ").size }
  puts sentence
  puts sentence.split(" ").length
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

longest_sentence("longest_sentence_example_text.txt")
longest_sentence("longest_sentence_frankenstein.txt")

# Test Cases