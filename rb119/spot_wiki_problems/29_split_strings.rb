=begin

29. Split Strings
(​https://www.codewars.com/kata/515de9ae9dcfc28eb6000001​)
6 kyu
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# PROBLEM
## INPUT: a string of alphabetical characters, no whitespace
## OUTPUT: an array of strings
## RULES
### Explicit requirements
  - split the input string into pairs of two characters
  - if there is an odd number of characters in the input string, then the last pair should have the last character plus an "_"
### Implicit requirements
  - all characters lowercase
  - no whitespace or other non-alphabetic characters in the input string
  - input string can be empty
  
# EXAMPLES
p solution('abc') == ['ab', 'c_'] # odd number of characters 3
p solution('abcdef') == ['ab', 'cd', 'ef'] # even returned as single quote string
p solution("abcdef") == ["ab", "cd", "ef"] # returned as double quote string
p solution("abcdefg") == ["ab", "cd", "ef", "g_"] # odd
p solution("") == [] # input string empty

# DATA STRUCTURES
INPUT: a string
INTERMEDIATE: maybe the output array to collect the pairs
An array of chars of the input string?
OUTPUT: an array of string pairs

# ALGORITHM
* CREATE an empty output array
* RETURN output array if string is empty
* DETERMINE if input string has odd or even number of characters
  + COUNT characters of input string
    - string.odd?
  + IF odd, then append an underscore to the intput string
  + ELSE do nothing
* MOVE through the input string from index 0 to index -1
  + use an #upto iterator with parameter as index
* SHOVEL substring into array WHEN index % 2 == 0
* RETURN output array
=end
require 'pry'
require 'pry-byebug'

def solution(string)
  array = []
  return array if string.empty?
  string << "_" if string.length.odd? 
  1.upto(string.length) do |index|
    if index % 2 == 0
      array << (string[index - 2] + string[index - 1])
    end
  end
  array
end
   
p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"] 
p solution("") == []

