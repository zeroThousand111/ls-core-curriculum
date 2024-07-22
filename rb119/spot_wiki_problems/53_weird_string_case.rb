=begin
53. WeIrD StRiNg CaSe
(​https://www.codewars.com/kata/52b757663a95b11b3d00062d​)
6 kyu

Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

# UNDERSTAND THE PROBLEM
## INPUT: a string
## OUTPUT a new string
## RULES
### Explicit requirements:
  - new string has all even index chars upcased and all even index chars lowercase
  - 0th char is even; therefore uppercased
  - input string only contains alphabetic chars and whitespace
  - words are separated by whitespace
  
### Implicit requirements:
  - IMPORTANT the words have the weird case, not the entire input string

# EXAMPLES
p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe" # this cannot be correct, because it should be "WeIrD StRiNg cAsE"

# DATA STRUCTURES
INPUT: a string
OUTPUT: a new string
Intermediate: an array of words / substrings

# ALGORITHM
* SPLIT the input string into an array of words
* MOVE through the array of words, from the first word to the last
* TRANSFORM the words 
  + use #map
  * use helper method
  * SPLIT current word into an array of characters
    + use #chars
  * CREATE empty string to build new word
  * MOVE through the array of chars from first character to the last
    + use #each_with_index to track both char and index
  * DETERMINE if char index is odd or even
    + use even?
  * ACT upon the above determination
    + IF the index is even, then SHOVEl an uppercase char to the new word
    + ELSE SHOVEL a lowercase char to the new word
  * RETURN new word
* JOIN the array of words into an output string
  + use #join(" ")

=end
def create_word(input_word)
  output_word = ""
  input_word.chars.each_with_index do |char, index|
    if index.even?
      output_word << char.upcase
    else
      output_word << char.downcase
    end
  end
  output_word
end

def weirdcase(input_string)
  array = input_string.split
  array.map do |word|
    create_word(word)
  end.join(" ")
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe" 