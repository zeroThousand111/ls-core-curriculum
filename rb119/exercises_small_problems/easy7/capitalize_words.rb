=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

INPUT: a string

OUTPUT: NEW string

RULES
EXPLICIT REQUIREMENTS:
  - new string contains same value as the argument string
  - every "word" is capitalised
  - assume that words are any sequence of non-blank characters
  
IMPLICIT REQUIREMENTS:
  - a "word" is a sequence of letters delineated by whitespace
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

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
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

# solution 1 - the most obvious solution

def word_cap(string)
  string.split.map { |word| word.capitalize}.join(" ")
end

# -------------------

# solution 2 - FURTHER EXPLORATION - #capitalize not allowed

def word_cap(string)
  string.split.map do |word|
    new_word = ""
    index = 0
    loop do
      # binding.pry
      if index == 0
        new_word << word[index].upcase
      else
        new_word << word[index].downcase
      end
      index += 1
      break if index == word.length
    end
    new_word
  end.join(" ")
end

# -------------------

# solution 3 - FURTHER EXPLORATION - #capitalize not allowed. Use #map.with_index on every letter of each word

def word_cap(string)
  string.split.map do |word|
    word.split(//).map.with_index do |letter, index|
      # binding.pry
      if index == 0
        letter.upcase
      else
        letter.downcase
      end
    end.join
  end.join(" ")
end

# -------------------

# solution 4 - FURTHER EXPLORATION - #capitalize not allowed. Refactor above solution using a ternary statement

def word_cap(string)
  string.split.map do |word|
    word.split(//).map.with_index do |letter, index|
      index == 0 ? letter.upcase : letter.downcase
    end.join
  end.join(" ")
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p word_cap('four score and seven') # 'Four Score And Seven'
p word_cap('the javaScript language') # 'The Javascript Language'

# Test Cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'