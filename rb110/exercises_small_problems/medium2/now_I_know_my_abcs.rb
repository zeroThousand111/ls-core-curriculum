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


INPUT: A string

OUTPUT: A boolean

RULES
EXPLICIT REQUIREMENTS:
  - Each letter in each block can only be used once.
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Hash - for links between letters on the same block
Array - for the alphabet available to the spelled word
Array - for the input_string split into separate characters

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create a hash of spelling blocks where key is first letter and value is the second and then where more keys are the second letter and first is the value.
2. Create an array of all alphabetical letters in lower case
3. Convert input_string to lowercase (#downcase)
4. Split the input_string into an array of characters (#chars)
5. Iterate over the array of characters:
  a. Take the first character and remove the corresponding key and value from the   alphabet
  b. Check that the next character and the corresponding key are in the alphabet   array
    i. If they are, carry on to c.
    ii. If they are not, return false
  c. Take the next character and remove it and the corresponding key and value   from the alphabet
  d. If all the characters pass without a return of false, return true
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

BLOCK_PAIRS = {
  "b" => "o",
  "o" => "b",
  "x" => "k",
  "k" => "x",
  "d" => "q",
  "q" => "d",
  "c" => "p",
  "p" => "c",
  "n" => "a",
  "a" => "n",
  "g" => "t",
  "t" => "g",
  "r" => "e",
  "e" => "r",
  "f" => "s",
  "s" => "f",
  "j" => "w",
  "w" => "j",
  "h" => "u",
  "u" => "n",
  "v" => "i",
  "i" => "v",
  "l" => "y",
  "y" => "l",
  "z" => "m",
  "m" => "z",
}


# solution 1 - using a simple loop

# def block_word?(input_string)
#   string = input_string.downcase
#   alphabet = ("a"..."z").to_a
  
#   counter = 0
#   loop do
#     # binding.pry
#     return false if alphabet.delete(BLOCK_PAIRS[string[counter]]) == nil
#     alphabet.delete(string[counter])
#     counter += 1
#     break if counter == string.size
#   end
  
#   true
# end

# -------------------

# solution 2 - using #each

def block_word?(string)
  string.downcase!
  alphabet = ("a"..."z").to_a
  
  string.chars.each do |letter|
    if alphabet.delete(BLOCK_PAIRS[letter]) == nil
      return false
    else
      alphabet.delete(letter)
    end
  end
  
  true
end

# -------------------

# solution 3 - official LS solution

# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

# Print Tests
# p block_word?('BATCH') # true
# p block_word?('BUTCH') # false
# p block_word?('jest')  # true

# Test Cases
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true