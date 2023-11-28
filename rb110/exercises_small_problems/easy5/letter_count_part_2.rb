=begin
________________________________________________________________________________
*****Problem*****

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

Examples
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  A string of space-separated words.
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  A hash that shows the number of words of different lengths.
  
Explicit reqs:
  # What does the problem say about what you should do?
  
  - Write a method;
  - Words consist of any string of characters that do not include a space.
  - NEW Don't count non-alphabetical characters
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  
  - "Size" of words means LENGTH of words;
  - Hash format will be:
    - Key: number of letters in word
      => 
    - Value: frequency that length of word occurs in the string
  - "Show" means output the hash;
  - 
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  - An array of sub-strings - each word
  - Hash of word_length => frequency pairs
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  1. Create an array of words from the input String;
  2. Create an empty hash;
  3. Measure length of first word in array
  4. Create key-value pair in hash from first word
      a. NEW count only
      b. Key will be number of alphabetical characters only
      c. Value will be 1
  5. Measure length of second word in array
  6. Do one of two things:
      a. IF the length of the second word is the same as the first word, add 1 to the value of the frequency of that key
      b. ELSE IF the length is different, create a new key of the length of the word and give it a value of 1
  7. Repeat steps 5-6 above until all words in array have been measured
  8. Output the hash
  
________________________________________________________________________________
Time to code!
=end

#solution 1: Modifying word_sizes solution 5 from letter_count_part_1.rb and adding looping helper method

# def count_a_to_z(word)
#   alphabetic = 0
#   counter = 0
  
#   loop do
#     alphabetic += 1 if word[counter].match?(/[a-zA-Z]/)
#     counter += 1
#     break if counter == word.size
#   end
#   alphabetic
# end

# def word_sizes(string)
#   hash = Hash.new(0)
  
#   string.split.each do |word|
#     hash[count_a_to_z(word)] += 1
#   end
#   hash
# end


# solution 2: refactor count_a_z helper method without a loop
# def count_a_to_z(word)
#   word.chars.count do |char|
#     char.match?(/[a-zA-Z]/)
#   end
# end

# def word_sizes(string)
#   hash = Hash.new(0)
  
#   string.split.each do |word|
#     hash[count_a_to_z(word)] += 1
#   end
#   hash
# end

# solution 3: official LS solution

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

# print tests
# p word_sizes("What's up doc?") # { 5 => 1, 2 => 1, 3 => 1 }

# p count_a_to_z("What's") # 5
# p count_a_to_z("doc?") # 3

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}