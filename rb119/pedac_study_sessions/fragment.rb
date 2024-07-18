=begin
Given a string and an integer i, write a method that splits the string up into a sentence of strings, where each string in the sentence contains a character of the argued string and every ith character after it:

# UNDERSTAND THE PROBLEM
## INPUT: a string AND an integer
## OUTPUT: a NEW string
## RULES
### Explicit requirements:
  - a method;
  - the method should split the string;
  - the string should be a sentence of "strings", where every "string" contains a character of the original string in the input string and then every nth character after it (where n is the second argument)

### Implicit requirements:
  - the number of words in the returned string is the same as the number of characters in the input string?
  - if i is less than 1, return the string "i cannot be less than 1"
  - empty string argument is allowed, but the return will be an empty string
  - all letters are lowercase

# EXAMPLES

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""

# DATA STRUCTURES

INPUT: a string and an integer
INTERMEDIATE: 
- an array of string words to be later joined into the output string
- an empty string that has a characters shovelled onto it
OUTPUT: a string

# ALGORITHM

* CREATE an empty array of string words
    - array_of_words = []
* MOVE through the input string, from the first character to the last
  + use #chars.each_with_index method chain
* DETERMINE if the character is a letter or whitespace
* ACT upon the determination
  + IF the character is whitespace, move on and do nothing
  + ELSE if the character is a letter:
  * USE helper method
  
  ---
  * CREATE a local variable to store a new word
      - current_word = ""
  * SHOVEL current character to front of current_word
      - current_word << char
  * CREATE a substring array 
      - substring_array = input_string[index..-1].chars
  * MOVE through the characters of the substring array from first to last
    + use #each_with_index
  * DETERMINE if the index of the current char is equally divisible by i
      - index % i == 0
  * ACT upon the above determination
    + IF the current char is equally divisible by i, then SHOVEL it to the word string
    + ELSE move on
  * STOP moving through the substring array
  * RETURN the word
  ---
  
* SHOVEL word into array of words
* STOP moving through the input string, after last character is reached
* JOIN the array of words into an output string and RETURN
  + use #join
    - array_of_words.join(" ")
=end

def create_word(substring, i)
  word = ""
  array = substring.delete(" ").chars
  array.each_with_index do |char, index|
    if index % i == 0
      word << char
    end
  end
  word
end

# p create_word("abcde", 1) == "abcde"
# p create_word("abcde", 2) == "ace"
# p create_word("axxaxxa", 3) == "aaa"

def fragment(input_string, i)
  return "i cannot be less than 1" if i < 1
  array_of_words = []
  
  input_string.chars.each_with_index do |char, index|
    if char.match?(/[a-z]/)
      substring = input_string[index..-1]
      array_of_words << create_word(substring, i)
    end
  end

  array_of_words.join(" ")
end

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""