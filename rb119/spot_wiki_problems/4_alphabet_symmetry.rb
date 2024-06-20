=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
solve(["abode","ABc","xyzD"]) = [4, 3, 1] See test cases for more examples.
Input will consist of alphabet characters, both uppercase and lowercase. No spaces. Good luck!

# UNDERSTAND THE PROBLEM
## INPUT: an array of strings
## OUTPUT: an array of Integers
## RULES
### Explicit requirements
 - Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word.
 - In other words, return an array of counts of matches where the string index of a character in a word is the same as the alphabet index
 - Ignore case
 - 
### Implicit requirements
  - "words" don't contain any whitespace or non-alphabetic characters
  - "words" can contain both upper and lowercase letters
  - the return isn't dependent upon the size of the "word", but a larger "word" has more potential for letters that match the alphabet index
  
# EXAMPLES / TEST CASES

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7] 
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# DATA STRUCTURES
- Strings
- An array of strings
- An array of Integers to be returned

# ALGORITHM

* CREATE an empty array of Integers (counts)
    - counts = []
* CREATE an alphabet array with which to compare indexes
  + the index of the strings in the alphabet array can be compared with later
* MOVE through the array of strings from the first string to the last
  + use #each
  * MOVE through the characters of each string from the first to the last AND track index
    + use #each_char and # with_index in a method chain
      - string.each_char.with_index do |char, index|
  * CREATE a local variable temp_count to track number of matches
      - temp_count = 0
  * COMPARE the index of the character in the string with the alphabet index
    + use Array#index
    + discount case sensitivity by downcasing the argument to #index
      - index == alphabet.index(char.downcase)
  * ACT on the result of the comparison
    + IF its a match, then increment the temp_count by 1
    + ELSE move on
  * STOP moving through the array of characters for that string
  * SHOVEL the value of temp_count to the count array
      - counts << temp_count
* RETURN the counts array
=end

def solve(array_of_strings)
  alphabet = ("a".."z").to_a
  counts = []
  array_of_strings.each do |string|
    temp_count = 0
    string.each_char.with_index do |char, index|
      temp_count += 1 if index == alphabet.index(char.downcase)
    end
    counts << temp_count
  end
  
  counts
end

# my tests
# p solve(["abode"]) #== [4]

# tests
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7] 
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]