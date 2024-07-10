=begin
33. Replace With Alphabet Position
(​https://www.codewars.com/kata/546f922b54af40e1e90001da​)
6 kyu
In this kata you are required to, given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it. "a" = 1, "b" = 2, etc.

# PROBLEM
## INPUT: a string of alphabetic characters
## OUTPUT: a string of numeric characters
## RULES
### Explicit requirements:
  - return a string where alphabetic characters are replaced by their numeric string equivalent in a new string
  - ignore any character that is not alphabetic
  
### Implicit requirements:
  - numeric strings are separated by whitespace
  - 

# EXAMPLE

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

# DATA STRUCTURE
Input: string
Intermediate: 
  - an array of characters from the input string
  - an array of numeric substrings
Output: string

# ALGORITHM
* CREATE a Hash of alphabetic characters from a to z
    - alpha_array = ("a".."z").each_with_object({}) {|char, hash| hash
* SPLIT the input string into characters
  + use #chars
* CREATE an empty array of numeric substrings
   - numeric_substrings = []
* MOVE through the array of characters from the first to the last
  + use #each
    - array_of_chars.each do |char|
* DETERMINE what the current character is
  + IF char is alphabetic, SHOVEL numeric equivalent to the numeric substrings array
  + use #match? to determine
    - numeric_substrings << alpha_array[char].to_s if char.downcase.match?(/[a-z]/)
  + ELSE do nothing, move on
* STOP moving through the array of characters
* JOIN the numeric substrings array into a string and RETURN

=end

def create_alpha_hash
  position = 1
  ("a".."z").each_with_object({}) do |char, hash|
    hash[char] = position
    position += 1
  end
end

def alphabet_position(input_string)
  alpha_hash = create_alpha_hash
  array_of_chars = input_string.chars
  numeric_substrings = []
  
  array_of_chars.each do |char|
    numeric_substrings << alpha_hash[char.downcase].to_s if char.downcase.match?(/[a-z]/)
  end
  numeric_substrings.join(" ")
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""