=begin
32. Highest Scoring Word
(​https://www.codewars.com/kata/57eb8fcdf670e99d9b000272​)
6 kyu
Given a string of words, you need to find the highest scoring word.
Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc. You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.
# PROBLEM
## INPUT: a string of "words"
## OUTPUT: a string of one "word"
## RULES
### Explicit requirements
  - give alphabetic characters a score; starting with a = 1 to z = 26
  - all characters are lowercase
  - all input is valid, e.g. no empty input strings
  - 
### Implicit requirements
  - a "word" is a substring delineated by whitespace
  
# EXAMPLES
p high('man i need a taxi up to ubud') == 'taxi' 
p high('what time are we climbing up the volcano') == 'volcano' 
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'

# DATA STRUCTURES

Intermediate: an array of "words", aka substrings and a Hash of scores for characters

# ALGORITHM
## HIGH LEVEL STEPS
1. Create a hash of alphabetic characters and their respective scores
2. Calculate the score of each word of the input string
3. Return the highest scoring word

1. Create a hash of alphabetic characters and their respective scores
* CREATE a hash of scores
  + use a helper method
2. Calculate the score of each word of the input string
* SPLIT the input string into an array of words
  + use #split(" ")
* CREATE an empty hash to store the words
3. Return the highest scoring word

=end

def create_score_hash
  score = 1
  ("a".."z").each_with_object({}) do |letter, hash|
    hash[letter] = score
    score += 1
  end
end

def high(input_string)
  score_hash = create_score_hash
  array_of_words = input_string.split(" ")
  word_hash = {}
  array_of_words.each do |word|
    score = 0
    word.chars.each do |char|
      score += score_hash[char]
    end
    word_hash[word] = score
  end
  word_hash.max_by { |k,v| v}.first
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano' 
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'