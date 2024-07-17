=begin
## Problem 8

Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

# PROBLEM
## INPUT: a non-empty string of only lowercase alphabetic characters
## OUTPUT: an integer, the length of the longest vowel string
## RULES
### Explicit requirements:
  - a method;
  - return the length of the longest vowel substring
  - 

### Implicit requirements:
  - 

# EXAMPLES

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5


The above tests should each print `true`.

# DATA STRUCTURES

Input: a string
Intermediate: 
 - an array of all substrings
 - an array of only vowel substrings
Output: an integer, the length of the longest vowel substring

# ALGORITHM
## HIGH-LEVEL 
1. CREATE an array of all possible consecutive substrings
2. SELECT only the substrings consisting of just vowels
3. RETURN the length of the longest vowel substring

1. CREATE an array of all possible consecutive substrings
* CREATE an empty array of all substrings
* MOVE through the input string from first character to the last to create a start index
  + use #upto
* MOVE through the input string from the start_index to the last character
  + use #upto
* 
2. SELECT only the substrings consisting of just vowels
* MOVE through the array of all substrings from first substring to the last
  + use #select
* SELECT those substrings that ONLY consist of vowels
  + use #select
  + in block use #all?
3. RETURN the length of the longest vowel substring
* if array_of_vowel_substrings is empty, return 0 
* find the longest vowel substring
  + use #max_by
* 
=end

def create_array_of_substrings(string)
  array_of_all_substrings = []
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |stop_index|
      array_of_all_substrings << string[start_index..stop_index]
    end
  end
  array_of_all_substrings
end

def select_only_vowel_substrings(array)
  array.select do |substring|
    substring.chars.all? do |char|
      char.match?(/[aeiou]/)
    end
  end
end

def longest_vowel_substring(input_string)
  array_of_all_substrings = create_array_of_substrings(input_string)
  array_of_vowel_substrings = select_only_vowel_substrings(array_of_all_substrings)
  return 0 if array_of_vowel_substrings.empty?
  array_of_vowel_substrings.max_by { |substring| substring.length}.length
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

