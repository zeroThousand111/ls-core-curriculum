=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

INPUT: a string

OUTPUT: a boolean true or false

RULES
EXPLICIT REQUIREMENTS:
  - Each letter in each block can only be used once
  -
  -
  
IMPLICIT REQUIREMENTS:
  - input string can be uppercase or lowercase, but reference blocks might just be in uppercase, so beware!
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Could use hashes(think I did last time), but this time I'm going with Arrays

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.TRANSFORM input string to uppercase to allow comparison with reference blocks
  a.
    i.
2.CHECK each letter of the string against the letter blocks
  a.Move through the string by a loop or using #each_char
  b.Move through an array of characters instead
  c.IF the string contains letter block[0], return false if it also contains letter block[1] of the same block
    i.if blocks.each 
  d.IF the string contains letter block[1], return false if it also contains letter block[0] of the same block
  e.IF the string doesn't contain both letters from the same block, continue on to CHECK the next letter of the string
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

BLOCKS = [['B','O'],  ['X', 'K'],   ['D', 'Q'],   ['C', 'P'],   ['N','A'],
['G', 'T'],   ['R', 'E'],   ['F', 'S'],   ['J', 'W'],   ['H', 'U'],
['V', 'I'],   ['L', 'Y'],   ['Z', 'M']]

# solution 1 - searching for block[0] && block[1] in the string and return false if both found using String#include?

def block_word?(string)
  BLOCKS.each do |block|
    if string.upcase.include?(block[0]) && string.upcase.include?(block[1])
      return false
    end
  end
  true
end


# -------------------

# solution 2 - official LS solution

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end



# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

p block_word?('bOdY') == false
p block_word?('bAtCh') == true