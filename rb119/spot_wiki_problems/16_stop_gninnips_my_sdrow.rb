=begin
16. Stop gninnipS My sdroW!
(​https://www.codewars.com/kata/5264d2b162488dc400000001​)
6 kyu

Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.
Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

# UNDERSTAND THE PROBLEM
## INPUT: a string of one or more "words"
## OUTPUT: same string but with any "word" with five or more letters "reversed"
## RULES
### Explicit requirements:
  - a method;
  - input will be a string of one or more "words"
  - Strings passed in will consist of only letters and spaces
### Implicit requirements:
  - what is a "word"?  I'll assume alphabetic characters separated by whitespace
  - what is "reversed"?  Test cases show characters of "word" in reverse order
  - 
  
## EXAMPLES
p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"  6 and 7 letter words
p spinWords("This is a test") == "This is a test" no large words
p spinWords("This is another test") == "This is rehtona test" 7 letter
p spinWords("test") == "test" none

## DATA STRUCTURES
An array of substrings, aka "words"

## ALGORITHM
* SPLIT the input string into an array of words
  + Use String#split
* MOVE through the array of words, one at a time from the first word to the last
  + could use #map or #map! for transformation
* DETERMINE if the word is five letters or more 
* ACT upon the above determination
  + IF the word is five letters or more, then reverse the characters in the word
  + IF the word is four letters or fewer, don't do anything (other than return the word if using #map)
* STOP moving through the array of words
* JOIN the array of words into a string
  + Use #join with a whitespace separator (" ")
    - array_of_words.join(" ")
* RETURN the new string
=end

def spinWords(input_string)
  array_of_words = input_string.split
  array_of_words.map do |word|
    if word.length >= 5
      word.reverse
    else 
      word
    end
  end.join(" ")
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw" 
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test" 
p spinWords("test") == "test"
