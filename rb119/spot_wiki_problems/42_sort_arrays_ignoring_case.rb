=begin
42. Sort Arrays (Ignoring Case)
(​https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby​) 
6 kyu

Sort the given strings in alphabetical order, case insensitive. 

# PROBLEM
## INPUT: an array of strings
## OUTPUT: a new array of strings, with strings in alphabetical order
## RULES
### Explicit requirements
  - sort the strings in the input array into alphabetical order
### Implicit requirements
  - strings can be of different cases, and problem is NOT to sort in ASCIIbetical order
  - in other words, sort by alphabetical order of first character of each word
  - an array of one word is permitted
  
# EXAMPLES

For example:
["Hello", "there", "I'm", "fine"] --> ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"]) --> ["a", "B", "C", "d"]

# DATA STRUCTURES
Input: an array of strings
Output: an array of the same strings, but in alphabetical order
Intermediate: not necessary

# ALGORITHM
* SORT and return a new array of strings
  + use #sort
  

=end

def sortme(input_array)
  input_array.sort do |word1, word2|
    word1[0].downcase <=> word2[0].downcase
  end
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]