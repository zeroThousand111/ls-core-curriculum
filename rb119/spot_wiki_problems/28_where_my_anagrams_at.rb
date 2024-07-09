=begin
28. Where my anagrams at?
(​https://www.codewars.com/kata/523a86aa4230ebb5420001e1​)
5 kyu

What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. 

For example:
'abba' & 'baab' == true 
'abba' & 'bbaa' == true 
'abba' & 'abbba' == false
'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

# PROBLEM
## INPUT: a string and an array of strings
## OUTPUT: an array of strings
## RULES
### Explicit requirements
  - a method;
  - find all anagrams of string argument amongst the strings in the second array argument
  - return an array of those words in second argument that are anagrams
  - or return an empty array if no words are anagrams
### Implicit requirements
  - Neither first or second arguments will be empty
  - strings contain only alphabetic characters

# EXAMPLES

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []

# DATA STRUCTURES
Input: a string and an array of strings
Intermediate: maybe none, could use #select on input array to create output array
Output: an array of strings

# ALGORITHM

* MOVE through the input array from first string to the last
* DETERMINE if current string is an anagram of the string argument
  + what is an anagram in code terms?
  + is an anagram if input_string.sort == current_string.sort
  + use small helper method here
* ACT on above determination
  + IF the word is an anagram, SELECT it
  + ELSE move on and do nothing
* RETURN array of selected strings that are anagrams
=end

def is_anagram?(input_string, current_word)
  input_string.chars.sort.join == current_word.chars.sort.join
end

# p is_anagram?('abba', 'aabb') == true
# p is_anagram?('abba', 'aabc') == false

def anagrams(input_string, input_array)
  input_array.select do |current_word|
    is_anagram?(input_string, current_word)
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []
