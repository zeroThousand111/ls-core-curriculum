=begin
57. Count letters in string
(​https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d​)
6 kyu

In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

# PROBLEM
## INPUT: a string of alphabetic characters
## OUTPUT: a hash
## RULES
### Explicit requirements:
  - count all lowercase letters in a string
  - return a hash
  - hash key must be letters as symbols
  - hash values must be count of that character as Integer

### Implicit requirements:
  - only one test case
  - all letters lowercase, and no non-alphabetic characters
  - 

# EXAMPLES
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# DATA STRUCTURES
## input: a string
## output: a hash
## intermediate: build the output hash, one char at a time

# ALGORITHM
* CREATE an empty output hash
* MOVE through the input string one character at a time, from the first character to the last
* DETERMINE if the current character is in the output hash
* ACT upon the determination
  * IF the character IS in the hash, then increment the value count by 1
  * ELSE add a symbol version of the character to the output hash
      - output[char] = 1
* STOP moving through the string when last character is reached
* RETURN the output hash

=end

def letter_count(string)
  output = {}
  string.each_char do |char|
    if output.include?(char.to_sym)
      output[char.to_sym] += 1
    else
      output[char.to_sym] = 1
    end
  end
  output
end

p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}