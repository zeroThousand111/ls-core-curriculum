=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.


INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.
  a.
    i.
2.
  a.
    i.
3.
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - 

def word_length(word)
  word.delete('^A-Za-z').length
end

def word_sizes(string)
  hash = {}
  array = string.split(' ')
  array.each do |word|
    if hash.has_key?(word_length(word))
      hash[word_length(word)] += 1
    else
      hash[word_length(word)] = 1
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
p word_sizes('Four score and seven.') #{ 3 => 1, 4 => 1, 5 => 2 }
p word_sizes("What's up doc?") # { 5 => 1, 2 => 1, 3 => 1 }

# Test Cases
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}