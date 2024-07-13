=begin
38. String transformer
(​https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby​)
6 kyu

Given a string, return a new string that has transformed based on the input:
Change case of every character, ie. lower case to upper case, upper case to lower case. Reverse the order of words from the input.

Note: You will have to handle multiple spaces, and leading/trailing spaces.
For example:
"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

# PROBLEM
## INPUT: a string
## OUTPUT: a transformed NEW string
## RULES
### Explicit requirements:
  - transformed string has words in reverse order
  - transformed characters have reversed capitalisation
  - retain whitespace
### Implicit requirements:
  - just one test case!  Might have to make my own

# EXAMPLES
"Example Input" ==> "iNPUT eXAMPLE"

# DATA STRUCTURES
Intermediate: an array of words

# ALGORITHM
## HIGH LEVEL
1. Reverse the order of words
2. Reverse the capitalisation of each character

1. Reverse the order of words
* SPLIT the input string into an array of "words"
  + use #split.reverse.join(" ") method chain

2. Reverse the capitalisation of each character
* CREATE empty output string
* MOVE through the reversed string from first char to the last
* DETERMINE if current char is lower case or uppercase or whitespace
  + uppercase if char.match?(/[A-Z]/)
  + lowercase if char.match?(/[a-z]/)
  + else whitespace
* ACT on above determination
  + IF uppercase, then SHOVEL lowercase
  + IF lowercase, then SHOVEL uppercase
  + IF whitespace, then SHOVEL

=end

def string_transformer(input_string)
  reversed_string = input_string.split.reverse.join(" ")
  output_string = ""
  reversed_string.each_char do |char|
    if char.match?(/[A-Z]/)
      output_string << char.downcase
    elsif char.match?(/[a-z]/)
      output_string << char.upcase
    else
      output_string << char
    end
  end
  output_string
end

p string_transformer("Example Input")