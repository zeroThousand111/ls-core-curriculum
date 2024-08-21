=begin
5.Longest vowel chain
(​https://www.codewars.com/kata/59c5f4e9d751df43cf000035/train/ruby​) 7 kyu
=begin
Longest vowel chain
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

 #UNDERSTAND
 ## INPUT: a string of lowercase alphabetic characters
 ## OUTPUT: an Integer
 ## RULES
 ### EXPLICIT REQUIREMENTS
   - return the length of the longest vowel chain as an integer
   - vowels are aeiou (not y)
 ### IMPLICIT REQUIREMENTS
   - some input will have multiple vowel chains

# DATA STRUCTURES
input: a string
output: an Integer
intermediate:
  - maybe an array of all substrings
  - maybe an array of all vowel-only substrings
  - maybe an array of lengths of vowel-only substrings

# ALGORITH
## APPROACH 1
1. Create an array of all possible substrings of consecutive characters from the input string
2. Select those substrings that are vowel only
3. Transform those vowel-only substrings into lengths (integers)
4. Return the longest length value from the array of lengths

## DETAIL
1. Create an array of all possible substrings of consecutive characters from the input string
2. Select those substrings that are vowel only
  + use #select
  + use #all?
  + use #match?(/[aeiou]) in the block
3. Transform those vowel-only substrings into lengths (integers)
  + use #map
  + use substring.length in the block
4. Return the longest length value from the array of lengths
  + use #max on the array
=end

def create_substrings(input)
    substrings = []
    0.upto(input.length - 1) do |start_index|
      start_index.upto(input.length - 1) do |stop_index|
         substrings << input[start_index..stop_index]
      end
    end
    substrings
end

def select_vowels_only(all_substrings)
  all_substrings.select do |substring|
    substring.chars.all? do |char|
      char.match?(/[aeiou]/)
    end
  end
end

def calculate_lengths(vowels_only)
  vowels_only.map do |substring|
    substring.length
  end
end

def solve(input)
  all_substrings = create_substrings(input)
  vowels_only = select_vowels_only(all_substrings)
  lengths = calculate_lengths(vowels_only)
  lengths.max
end

p solve("codewarriors") == 2 #io
p solve("suoidea") == 3 #uoi
p solve("iuuvgheaae") == 4 # eaae
p solve("ultrarevolutionariees") == 3 # iee
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2 #oi eo ua
p solve("chrononhotonthuooaos") == 5 
p solve("iiihoovaeaaaoougjyaw") == 8