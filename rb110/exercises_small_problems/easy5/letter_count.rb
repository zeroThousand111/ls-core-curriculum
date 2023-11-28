=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

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
  
  word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
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
      a. Key will be length of word
      b. Value will be 1
  5. Measure length of second word in array
  6. Do one of two things:
      a. IF the length of the second word is the same as the first word, add 1 to the value of the frequency of that key
      b. ELSE IF the length is different, create a new key of the length of the word and give it a value of 1
  7. Repeat steps 5-6 above until all words in array have been measured
  8. Output the hash
  
________________________________________________________________________________
Time to code!
=end

# solution 1: Using loop to iterate through array of words

# def word_sizes(string)
#   hash = {}
#   return hash if string.size == 0
#   array = string.split
  
#   counter = 0
#   loop do
#     word_length = array[counter].size
    
#     if hash.key?(word_length)
#       hash[word_length] += 1
#     else
#       hash[word_length] = 1
#     end
#     counter += 1
#     break if counter == array.size
#   end
#   hash
# end

# solution 2: Iterate using #each

# def word_sizes(string)
#   hash = {}
#   return hash if string.size == 0
#   array = string.split
  
#   array.each do |word|
#     if hash.key?(word.size)
#       hash[word.size] += 1
#     else
#       hash[word.size] = 1
#     end
#   end
#   hash
# end

# solution 3: #each_with_object

# def word_sizes(string)
#   array = string.split
  
#   final_hash = array.each_with_object({}) do |word, hash|
#                   if hash.key?(word.size)
#                     hash[word.size] += 1
#                   else
#                     hash[word.size] = 1
#                   end
#                 end
#   final_hash
# end

# solution 4: LS official solution.  AHA!  This just overwrites the value of the key-value pair if one already exists with the same key.  It just uses how hash element assignment naturally works.

def word_sizes(words_string)
  counts = Hash.new(0) # could just as easily be counts = {}
  words_string.split.each do |word|
    counts[word.size] += 1 # creates new key-value pair or overwrites value of existing one
  end
  counts
end

# print tests
# p word_sizes("What's up doc?") # { 6 => 1, 2 => 1, 4 => 1 }

# test cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}