=begin
Given two words, how many letters do you have to remove from them to make them anagrams?

# PROBLEM
## INPUT: two strings of alphabetic characters, two "words"
## OUTPUT: an integer
## RULES
### EXPLICIT REQUIREMENTS
- return an Integer that represents the number of characters needed to be taken away from either input string to make it an anagram

### IMPLICIT REQUIREMENTS
- what is an "anagram"? An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once
- in other words, an "anagram" is a word that has the same letters as another word, but not necessarily in the same order
- an anagram can be found by comparing an alphabetically sorted word with another alpabetically sorted word
  i.e. "abc".sort == "cab".sort will be true
- empty string arguments may be given
- an anagram of '' is ''
- it is IMPLIED that where there may be more than one common anagram, the return should be based on how many characters are deleted to arrive at the LONGEST one
- "remove" means delete characters from EITHER string argument
- the test cases show that not the same number of characters are deleted from both strings to make an anagram
- two substrings with the same number of the same letters, common 

# EXAMPLES
anagram_difference('', '') == 0
anagram_difference('a', '') == 1 # '' remove 1 from string1
anagram_difference('', 'a') == 1 # '' remove 1 from string2
anagram_difference('ab', 'a') == 1 # 'a' remove 1 from string1
anagram_difference('ab', 'ba') == 0 # input strings are anagrams of each other
anagram_difference('ab', 'cd') == 4 # '' remove 2 each from string1 and string2
anagram_difference('aab', 'a') == 2 # 'a' remove 2 from string1
anagram_difference('a', 'aab') == 2 # 'a' remove 2 from string2
anagram_difference('codewars', 'hackerrank') == 10 # 'acer' remove 4 from string1 and 6 from string2
anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42 # i've no idea what the substring anagrams are here
anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50 # i've no idea what the substring anagrams are here

# DATA STRUCTURES
INPUT: two strings, made of only alphabetic lowercase characters
OUTPUT: an Integer
INTERMEDIATE:
 - 

# ALGORITHM

## HIGH-LEVEL APPROACH 1

1. CREATE an array of all substrings of string1 and an array of all substrings of string2, including empty strings "" to represent characters being removed from the input string
2. SORT the substrings themselves into alphabetical order, to create uniformity when comparing them later
3. SORT both these arrays of substrings by length of substring from longest substring length to shortest, because we want to find the longest anagram if there are more than one
4. TEST each substring from string1 against each substring of string2 to see if the are the same
5. When a match is found, NOTE the length of each substring
6. CALCULATE the difference between the combined lengths of string1 + string2 and the combined lengths of match1 and match2
7. RETURN the difference as an Integer

THIS APPROACH CAN'T WORK.  I CAN'T SELECT THE ALL THE POSSIBLE SUBSTRINGS AND IN RUN OUT OF MEMORY TO HOLD THEM IN ANY CASE!

## HIGH-LEVEL APPROACH 2
1. Find the anagram common to both input strings
  a.Find the characters common to both input strings, this is the anagram
  b.If there are no common characters the anagram must be ""
2. Count the letters in both strings combined
3. Count the letters in the anagram multiplied by 2
4. Return the result of combined - (anagram * 2)



## DETAIL
1. Find the anagram common to both input strings
  a.Find the characters common to both input strings, this is the anagram
  
* FIND the characters in string1 that are common to string2
* SELECT the characters in string1 that are included in string2
  + use #chars.select chain
    - string1.chars.select do |char| string2.include?(char)
* COUNT the number of occurences 


* CREATE an empty tally hash
  use tally

  b.If there are no common characters the anagram must be ""
  
2. Count the letters in both strings combined
* Combined count is sum of characters in both input strings
  + string1.length + string2.length
3. Count the letters in the anagram multiplied by 2
* Measure anagram length
    - anagram.length
4. Return the result of combined_count - (anagram_count * 2)

=end

def find_common_chars(string1, string2)
  # find the unique letters common to both strings
  common_letters = string1.chars.select { |char| string2.include?(char) }.uniq
  
  # create tally hashes of letters and their frequencies in both strings
  tally1 = string1.chars.tally
  tally2 = string2.chars.tally
  
  # build a string containing the min number (smallest from string1 or string2) for each common letter
  anagram_letters = ''
  common_letters.each do |letter|
    reps = [tally1[letter], tally2[letter]].min
    anagram_letters << (letter * reps)
  end

  anagram_letters.length
end

def anagram_difference(string1, string2)
  anagram_count = find_common_chars(string1, string2)
  (string1.length - anagram_count) + (string2.length - anagram_count)
end

# TEST CASES
p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10 # look for `acer` as the common anagram
p anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
p anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50

# MY TEST CASES
# p anagram_difference('', '')
# p anagram_difference('ab', 'a')
# p anagram_difference('ab', 'ba')
# p anagram_difference('codewars', 'hackerrank')
# p anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw")
# p anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt")