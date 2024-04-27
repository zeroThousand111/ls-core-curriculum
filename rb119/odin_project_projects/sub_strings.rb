=begin
# Problem
Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

## Input: A string with one or more words, and a dictionary; an array of strings
## Output: a Hash (keys are dictionary substrings present in the string, values are frequencies)

## Rules:
### Explicit requirements
  - Method returns a hash of those substrings from the dictionary found in the string or strings 
  - Hash keys are substrings from the dictionary found to be included
  - Hash values are integers corresponding to frequency they occur
  
### Implicit requirements
  - Each string is one word, with no other string characters or whitespce
  - When a multi-word string is passed as an argument, it needs to be split into an array of word strings
  
# Examples/Test Cases

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("below", dictionary)
=> { "below" => 1, "low" => 1 }

substrings("Howdy partner, sit down! How's it going?", dictionary)
=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }


# Data Structures
Arrays, hashes and strings

# Algorithm

1.CREATE empty output hash
2.CREATE cleaned up string with no non-alphabetic characters and all lower case
  a. Use String#delete ?
  b. Use String#gsub or #gsub! with regex ?
    i. cleaned_string = string.gsub(/[^A-Za-z\s]/, '').downcase
3.CREATE an array of words
    i. array_of_words = cleaned_string.split
4.MOVE through the array of words
5.For EACH word in the array of words, MOVE through the dictionary array
  a. Use a loop
  b. Use #each
6.CHECK IF each substring in the dictionary is included in the string
  a.Use the String#include? method
    i. string_word.include?(dictionary_word)
7.ACT on the outcome of step 3 
  7.1.CREATE a new key-value pair IF substring is included AND it isn't already in the output hash
    a. Hash element assignment
      i. output_hash[dictionary_word] = 1
  7.2.UPDATE the value
    a. Increment the value by 1
    b. Hash element (re)assignment
      i. output_hash[dictionary_word] += 1
  7.3.Do nothing and move on if the current substring is not included
8.RETURN the output hash
=end

# Code
require 'pry'
require 'pry-byebug'

def substrings(string, dictionary)
  output_hash = {}
  cleaned_string = string.gsub(/[^A-Za-z\s]/, '').downcase
  array_of_words = cleaned_string.split
  
  array_of_words.each do |string_word|
    dictionary.each do |dictionary_word|
      if string_word.include?(dictionary_word) && output_hash.has_key?(dictionary_word)
        output_hash[dictionary_word] += 1
      elsif string_word.include?(dictionary_word)
        output_hash[dictionary_word] = 1
      end
    end
  end
  
  output_hash
end

# Print Test Cases
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# p substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

p substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

# Truth Tests
p substrings("below", dictionary) == { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary) == { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }