=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.


INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - words are separated by spaces i.e. ' '
  - return is a Hash
  -
  
IMPLICIT REQUIREMENTS:
  - Empty strings are allowed as input
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Hashes for key-value pairs of word_length => frequency
String input
Arrays to split string into words
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. SPLIT the string into words
  a.Words are delimited by white space ' '
  b.
    i. string.split(' ')
2. MEASURE the length of EACH word
  a. word.length
    i.
3. CREATE a Hash and CREATE a new key-value pair with key(Integer)=>value(Integer) and value of 1
  a.
    i.
4. IF a key already exists of that integer, increment the value of that key-value pair by 1
  a.
    i.
5. RETURN hash
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - 

def word_sizes(string)
  hash = {}
  array = string.split(' ')
  array.each do |word|
    if hash.has_key?(word.length)
      hash[word.length] += 1
    else
      hash[word.length] = 1
    end
  end
  hash
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p word_sizes("What's up doc?") # { 6 => 1, 2 => 1, 4 => 1 }

# Test Cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}