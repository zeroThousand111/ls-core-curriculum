=begin
40. Duplicate Encoder
(​https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby​)
6 kyu
The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

# PROBLEM
## INPUT: a string of characters
## OUTPUT: a new string of bracket characters
## RULES
### Explicit requirements:
  - convert a string into a new string
  - each character of the input string is transformed into either "(" or ")"
  - if current char appears only once, then transformed to "("
  - if current char appears more than once, then transformed to ")"
  - ignore capitalisation
  - 
### Implicit requirements:
  - alphabetic and non-alphabetic characters can be input
  - whitespace is counted as a character
  
# Examples
"din" => "(((" "recede" => "()()()" "Success" => ")())())" "(( @" => "))(("

# DATA STRUCTURES
INput: a string
Intermediate: build the output string once char at a time
Ouput: a new string

# ALGORITHM
* CREATE empty output string
    output_string = ""
* MOVE through input string one char at a time
  + use #each_char
* COUNT number of times present in whole input string
  + use string#count
    - string.count(current_char)
* SHOVEL either a "(" or a ")" to output string
  + output_string << "(" or output_string << ")"
  + use ternary statement
    - output_string << (count > 1) ? ")" : "("
* STOP moving through the intput string
* RETURN the output string
=end

def duplicate_encode(input_string)
  output_string = ""
  input_string.each_char do |char|
    if input_string.count(char.downcase) > 1
      output_string << ")"
    else 
      output_string << "("
    end
  end
  output_string
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())" 
p duplicate_encode("(( @") == "))(("