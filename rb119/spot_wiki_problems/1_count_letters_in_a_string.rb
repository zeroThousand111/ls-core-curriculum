=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

# UNDERSTAND THE PROBLEM

## INPUT: A String of characters making up a "word"
## OUTPUT: a Hash of key-value pairs, where the keys are symbols representing alpabetic letters in the input string, and values are Integers, representing the frequency that the letter appears in the input string
## RULES
### EXPLICIT REQUIREMENTS
  - the keys of the hash must be symbols (not strings)
  - the values of the hash must be counts, therefore Integers
  
### IMPLICIT REQUIREMENTS
  - the reference to "Crystal" makes no sense whatsoever; ignore it
  - there are no whitespaces in the test cases, so assume only one "word" will be input
  - there are no empty strings input
  - the entry order of key-value pairs is in ascending alphabetic order
  
# TEST CASES / EXAMPLES

Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2} =end
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})

# DATA STRUCTURES
- an input String
- might use an array of characters?
- a returned Hash of symbol-integer key-value pairs

# ALGORITHM

* CREATE an empty Hash of character counts
    - counts = {}
* MOVE through the string from beginning letter to the last
  + use #each_char or split using #chars into an array of characters
    - string.each_char do |char|
* DETERMINE if current character is already represented in the counts Hash
  + important!  the key will be a symbol and not a string character!
  + use Hash#include?
    - counts.include?(char.to_sym)
* ACT on the result of the above determination
  + IF the current character IS already in the hash, increment the value of that key-value pair by 1
    - counts{char.to_sym} += 1
  + ELSE if the current character IS NOT in the count hash, add a new key-value pair, with key being symbol equivalent of the string character and value being 1
    - counts{char.to_sym} = 1
* STOP moving through the string characters when the last character is dealt with
* RETURN the counts Hash
=end

def letter_count(string)
  counts = {}
  string.each_char do |char|
    if counts.include?(char.to_sym)
      counts[char.to_sym] += 1
    else
      counts[char.to_sym] = 1
    end
  end
  counts
end


# my tests

# p letter_count('a')

# test cases
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}