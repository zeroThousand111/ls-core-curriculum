=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text is found within the full_text. Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice solution('aaabbbcccc', 'bbb') # should return 1

# UNDERSTAND THE PROBLEM

## INPUT: two strings: a main string of characters and a substring to match and count in the string
## OUTPUT: an Integer representing the number of times that the search_text appears in the main string
## RULES:
### EXPLICIT REQUIREMENTS:
  - return an integer, representing the number of times that the search text is found in the "main text"
### IMPLICIT REQUIREMENTS:
  - search text can be one or more characters (so methods like String#count aren't instantly applicable)
  - test cases don't have whitespace, numbers or any non-alphabetical characters
  - 

# EXAMPLES / TEST CASES

p solution('abcdeb','b') == 2 # search text of one character
p solution('abcdeb', 'a') == 1 
p solution('abbc', 'bb') == 1 # search text of two characters

# DATA STRUCTURES
Strings - main text and search text

# ALGORITHM

* CREATE a count local variable to track frequency of matches
* CREATE an array of substrings from the main text that are the same number of characters long as the search text
  + e.g. if main text is 'abbc' and search text is 'bb', substrings will be ['ab', 'bb', 'bc']
  + Use #upto to move through the main text
  + start_index = 0
  + final_index = main_text.length - 1 - search_text.size
  + use String#slice
  + shovel each substring to the array of substrings
    array_of_substrings << string[index, length]
* MOVE through the array of substrings from first to last substring
* COMPARE each substring with the search text
* ACT on the result of the comparison
  + IF the substring matches the search text increment the value of count by one
    - count += 1 if substring == search_text 
  + ELSE move on
* STOP iterating at the last substring
=end

def solution(main_text, search_text)
  count = 0
  array_of_substrings = []
  search_length = search_text.length
  0.upto(main_text.length - search_length) do |index|
    array_of_substrings << main_text[index, search_length]
  end
  array_of_substrings.each do |substring|
    count += 1 if substring == search_text
  end
  count
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1 
p solution('abbc', 'bb') == 1
