=begin
```
# Understand the Problem
# Write function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

For example;

str1 is 'rkqodlw' and str2 is 'world' the output should return true
str1 is 'codewaraaossoqqyt' and str2 is 'codewars' the output should return true
str1 is 'katas' and str2 is 'steak' should return false

Only lower case letters will be used (a-z).  No punctuation or digits will be included.

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true

input: two strings
output: a boolean true or false
Rules:
  explicit requirements:
    - return true if part of str1 can be rearranged to match str2 (whole string)
    - in other words, every permutation of string1 
    - return false otherwise
    - only lowercase characters are used, no punctuation or digits

  implicit requirements:
    - input strings don't contain whitespace
    - 
# Examples / Test cases
p scramble('javaass', 'jjss') == false # no match
p scramble('rkqodlw', 'world') == true # match is 'rodlw' rearranged
p scramble('codewaraaossoqqyt', 'codewars') == true # match is 'code'
p scramble('katas', 'steak') == false # no match
p scramble('scriptjava', 'javascript') == true # match is 'java' and 'script'
p scramble('scriptingjava', 'javascript') == true # match is 'java' and 'script'

# Data Structures
Strings
Arrays

# Algorithm 1 - might have SystemStack memory issues due to large number of string permutations created for some test cases

* CREATE an empty array of substrings from string1
* CREATE an empty array of string permutations
* SELECT every substring from string1 and copy each to the array of substrings
  + use two nested #upto iterators
* For every substring in the array of substrings, create every permutation of that substring and copy it to the array of string permutations
  + use the Array#permutation method with the argument as the length of the substring
  + this create a very large number of strings
* CHECK to see if string2 matches any substring in the array of permutations, then return true if there is a match, return false otherwise
  + could use a ternary statement

# Algorithm 2 

Check that all the characters of string2 are present in string1 in equal or greater than the frequencies that exist in string1.  (To account for duplicate characters in strings, i.e. test case 1)

* CREATE a tally hash of count frequencies of string1
* CREATE a tally hash of count frequencies of string2
  + DEFINE a helper method to create a tally hash from a string
* CHECK that the same count frequences in tally_hash_1 or higher are present in tally_hash_2
  + Use Enumerable#all? to iterate through each char-frequency pair
    - tally_hash_2.all? { |char, frequency| tally_hash_1.has_key?(char) && tally_hash_1[char] >= frequency }
* RETURN the boolean value returned by the Enumerable#all? method

```
=end

# def create_permutations(string)
#   array_of_substrings = []
#   array_of_permutations = []
#   0.upto(string.length - 1) do |start_index|
#     start_index.upto(string.length - 1) do |stop_index|
#       array_of_substrings << string[start_index..stop_index]
#     end
#   end

#   array_of_substrings.each do |substring|
#     substring.chars.permutation(substring.length) { |word| array_of_permutations << word.join }
#   end
#   array_of_permutations
# end

# def scramble(string1, string2)
#   array_of_substrings = []
  
#   0.upto(string1.length - 1) do |start_index|
#     start_index.upto(string1.length - 1) do |stop_index|
#       array_of_substrings << string1[start_index..stop_index]
#     end
#   end
  
#   array_of_substrings.each do |substring|
#     substring.chars.permutation(substring.length) do |permutation|
#       return true if permutation.join == string2
#     end
#     false
#   end
  
#   false
# end

def create_tally_hash(string)
  tally_hash = {}
  string.chars.each do |char|
    if tally_hash.include?(char)
      tally_hash[char] += 1
    else
      tally_hash[char] = 1
    end
  end
  tally_hash
end

# for each k-v pair in string2, does string1 have that key and does it have the value of that key in that frequency or greater?

def scramble(string1, string2)
  tally_hash_1 = create_tally_hash(string1)
  tally_hash_2 = create_tally_hash(string2)
  tally_hash_2.all? do |char, frequency| 
    tally_hash_1.include?(char) && tally_hash_1[char] >= frequency
  end
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('codewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true