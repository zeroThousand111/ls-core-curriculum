=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.


# UNDERSTAND THE  PROBLEM

## INPUT: a string
## OUTPUT: an Integer, representing the length of the longest vowel substring in the input string
## RULES
### Explicit requirements:
  - return an Integer, representing the length of the longest vowel substring
  - input string is made of lowercase letters only, and no whitespace
  - vowels are any a, e, i, o, or u.  
### Implicit requirements:
  - y is not included as a vowel
  - there are likely to be multiple vowel-only substrings included in the input string

# EXAMPLES / TEST CASES

p solve("codewarriors") == 2 # io
p solve("suoidea") == 3 # uoi
p solve("iuuvgheaae") == 4 # eaae
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5 
p solve("iiihoovaeaaaoougjyaw") == 8

# DATA STRUCTURES
Input string
An array of substrings may be helpful

# ALGORITHM

* CREATE an empty array to collect vowel-only substrings
    - vowelly_substrings = []
--- START ITERATION
* SELECT every substring in turn
  + start index is 0
  + stop index is -1
  + use two nested #upto iterators
* DETERMINE if substring is only made of vowels
* ACT on above determination
  + IF substring is only made of vowels, SHOVEL substring into vowelly_substrings array
    + SPLIT substring into an array of characters, and use Array#all? to determine if each is a vowel
  + IF NOT, move on
-- STOP ITERATION
* RETURN length of longest substring in vowelly_substrings
  + use max_by.length method chain
    - vowelly_substrings.max.length
=end

require 'pry'
require 'pry-byebug'

def solve(string)
  vowelly_substrings = []
  0.upto(string.size - 1) do |start_index|
    start_index.upto(string.size - 1) do |stop_index|
      substring = string[start_index..stop_index]
      if substring.chars.all? { |char| char.match?(/[aeiou]/)}
        vowelly_substrings << substring
      end
    end
  end
#   binding.pry
#   vowelly_substrings.sort_by! { |substring| substring.length}
#   vowelly_substrings[-1].length
  vowelly_substrings.max_by { |sub| sub.length }.length
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5 
p solve("iiihoovaeaaaoougjyaw") == 8