=begin
Count letters in string
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.
Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# UNDERSTAND
## INPUT: a string (of lowercase alphabetic characters)
## OUTPUT: a tally hash
## RULES
### EXPLICIT REQUIREMENTS
  - return a tally hash of letter keys and frequency of occurence values
  - keys are symbols, not strings
  - 
### IMPLICIT REQUIREMENTS
  - none

# DATA STRUCTURES
input: a string
output: a tally hash
{ :letter=>frequency, etc}
intermediate: none, either build up an empty hash or create one using #tally
# ALGORITHM
## HIGH LEVEL APPROACH 1
1. Create a tally hash of the input string with strings as keys
2. Transform the tally hash keys from strings to symbols

## HIGH LEVEL APPROACH 2
1. Create an empty output hash
2. MOVE through the input string one character at a time
3. CHECK if the current char has a symbol version in the output hash
4. ACT upon the above check: if it is included, increment the value, if not add it to the hash as a new key-value pair
5. RETURN the output hash after moving through the whole input string

## DETAIL
1. Create a tally hash of the input string with strings as keys
  + use Array#tally
    - input.chars.tally
2. Transform the tally hash keys from strings to symbols
  + Use Enumerable#map
  + transform keys to symbols using #to_sym
=end
# def letter_count(input)
#   string_keys_hash = input.chars.tally
#   string_keys_hash.map do |key, value|
#     key.to_sym = value
#   end
# end

def letter_count(input)
    output = {}
    input.each_char do |char|
      if output.include?(char.to_sym)
        output[char.to_sym] += 1
      else
        output[char.to_sym] = 1
      end
    end
    output
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}