=begin
44. Counting Duplicates
(​https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby​)
6 kyu
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

# PROBLEM
## INPUT: a string
## OUTPUT: an integer
## RULES
### Explicit requirements
  - a method;
  - return a count of "distinct case-insensitive alphabetic characters and numeric digits" that occur more than once
  - in other words, return a count of how many characters occur more than once in the input string
  - input string only contains alphabetic and numerical characters
### Implicit requirements
  - 

# EXAMPLE
Example
"abcde" -> 0 # no characters repeats more than once "aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`) "indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice "aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

# DATA STRUCTURES
Input: string
Output: integer
Intermediate: a hash of counts

# ALGORITHM
* CREATE an hash of counts (tally hash)
* TRANSFORM input string to all downcased characters
* MOVE through the string from first character to the last
* DETERMINE if current char is present in the tally hash
* ACT on above determination
  + IF char not present in tally hash, then include it with value of 1
    - tally_hash[char] = 1
  + IF char present in tally hash, then increment value by 1
    - tally_hash[char] += 1
* STOP moving through the string when last character reached
* COUNT how many values in the tally hash is more than 1 and RETURN that value
  + use #select on the tally hash
    - tally_hash.select { |k, v| v > 1}
  + use #count to count the number of pairs left in the tally_hash and RETURN
=end

def duplicate_count(string)
  tally_hash = {}
  lower_case_string = string.downcase
  lower_case_string.each_char do |char|
    if tally_hash.include?(char)
      tally_hash[char] += 1
    else
      tally_hash[char] = 1
    end
  end
  tally_hash.select { |k, v| v > 1}.count
  
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2