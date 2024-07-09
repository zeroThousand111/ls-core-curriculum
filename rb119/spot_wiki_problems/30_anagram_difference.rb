=begin
30. Anagram difference
(​https://www.codewars.com/kata/5b1b27c8f60e99a467000041​)
6 kyu
Given two words, how many letters do you have to remove from them to make them anagrams? 

Example
First word : c od e w ar s (4 letters removed) w o
Second word : ha c k er r a nk (6 letters removed)
Result : 10
Hints
A word is an anagram of another word if they have the same letters (usually in a different order). Do not worry about case. All inputs will be lowercase.

# PROBLEM
## INPUT: two strings
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - all inputs are lowercase
  - return the sum of letters needed to be removed from BOTH strings to make them anagrams
  - A word is an anagram of another word if they have the same letters (usually in a different order)

### Implicit requirements:
  - one or both input strings may be empty
  - if the words are anagrams already, the return will be 0
  - two empty strings are "anagrams" for the purposes of this problem

# EXAMPLES 
p anagram_difference('', '') == 0 # anagram is ""
p anagram_difference('a', '') == 1 # anagram is ""
p anagram_difference('', 'a') == 1 # anagram is ""
p anagram_difference('ab', 'a') == 1 # anagram is "a"
p anagram_difference('ab', 'ba') == 0 # already anagrams of each other
p anagram_difference('ab', 'cd') == 4 # both lose two letters to become empty strings that are "anagrams"
p anagram_difference('aab', 'a') == 2 # anagram is "a"
p anagram_difference('a', 'aab') == 2 # anagram is "a"
p anagram_difference('codewars', 'hackerrank') == 10 # what is the common anagram?

# DATA STRUCTURES
Strings
Intermediate: an array of substrings for each word


# ALGORITHM
## HIGH LEVEL STEPS
1. CREATE arrays of all substrings for string 1 (including empty "")
2. CREATE arrays of all substrings for string 2 (including empty "")
3. DETECT if there is a common substring in both arrays
4. SUBTRACT length of matched substring1 from string1 to determine number of chars lost
5. SUBTRACT length of matched substring2 from string2 to determine number of chars lost
6. SUM and RETURN the number of removed chars

1. CREATE arrays of all substrings for string 1 (including empty "")
* CREATE an array of substrings for string1
    - array1 = []
* MOVE through string1 from first char to last char to create start_index
  + use an #upto iterator
  * MOVE through string1 from start_index char to last char to create stop_index
    + use an #upto iterator
* SHOVEL a sorted substring to the array of substrings
    - array << string[start_index..stop_index].chars.sort.join
2. CREATE arrays of all substrings for string 2 (including empty "")
* REPEAT process in 1 above
3. DETECT if there is a common substring in both arrays


=end

def find_common_word(array1, array2)
  array1.each do |substring1|
    array2.each do |substring2|
      if substring1 == substring2
        return substring1
      end
    end
  end
end

def generate_substrings(string)
  array = []
  0.upto(string.length - 1) do |start_index|
    start_index.upto(string.length - 1) do |stop_index|
      array << string[start_index..stop_index].chars.sort.join
    end
  end
  array << ""
  array
end

def anagram_difference(string1, string2)
  array1 = generate_substrings(string1)
  array2 = generate_substrings(string2)
  return 0 if string1.chars.sort.join == string2.chars.sort.join
  p common_word1 = find_common_word(array1, array2)
  p common_word2 = find_common_word(array2, array1)
  p num1 = string1.length - common_word1.length
  p num2 = string2.length - common_word2.length
  num1 + num2
end

# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'a') == 1
# p anagram_difference('ab', 'a') == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
# p anagram_difference('aab', 'a') == 2
# p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') #== 10