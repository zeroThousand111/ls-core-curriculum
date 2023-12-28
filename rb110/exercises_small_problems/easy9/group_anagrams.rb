=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - A program (not necessarily a method);
  - Output are groups of words that are anagrams;
  - Anagrams are words that have the same exact letters in them but in a different order.
  
IMPLICIT REQUIREMENTS:
  - Output are arrays of strings
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
["demo", "dome", "mode"]
["neon", "none"]
#(etc)

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create empty array (for matched strings);
2.Create helper method to find anagrams "word2".match?(/[word1]/)
3.Put first word of `words` collection into array;
4.If there is a match, put matched word into the array.
4.Test second word in collection against first word;
6.Test third word, etc, until all words compared to first;
7.If the array has more than one word in it, output it;
8.Then reassign a new empty array;
5.Repeat 3-8 above for second word, etc. until all words considered.
______________________________________________________________________________

Now CODE with intent!
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# solution 1 - using a simple loop

# def is_anagram?(word1, word2)
#   return false if word1 == word2
#   word1.count(word2) == word2.length
# end

# def find_anagrams(words)
#   tested_word_index = 0
  
#   loop do
    
#     array = [words[tested_word_index]]
#     match_word_index = 0
    
#     loop do
#       array << words[match_word_index] if is_anagram?(words[tested_word_index], words[match_word_index])
      
#       match_word_index += 1
#       break if match_word_index == words.size
#     end
    
#     p array if array.size >= 2
    
#     tested_word_index += 1
#     break if tested_word_index == words.size
#   end
# end

# -------------------

# solution 2 - using Array#each for outer and inner loops

def is_anagram?(word1, word2)
  return false if word1 == word2
  word1.count(word2) == word2.length
end

def find_anagrams(words)
  words.each do |test_word|
    array = []
    words.each do |match_word|
      array << match_word if is_anagram?(test_word, match_word)
    end
    p array if array.size >= 2
  end
end

# -------------------

# solution 3 - official LS solution

# result = {}

# words.each do |word|
#   key = word.split('').sort.join
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end
# end

# result.each_value do |v|
#   puts "------"
#   p v
# end

# Print Tests
# p is_anagram?('none', 'neon') # true
# p is_anagram?('none', 'noon') # false

# Test Cases
find_anagrams(words)