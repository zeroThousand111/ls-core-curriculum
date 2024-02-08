=begin

______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given a word, create a hash which stores the indexes of each letter in an array.
Make sure the letters are the keys.
Make sure the letters are symbols.
Make sure the indexes are stored in an array and those arrays are values.

INPUT: String

OUTPUT: Hash

RULES
EXPLICIT REQUIREMENTS:
  - Return a Hash
  - Keys are the letters as symbols
  
IMPLICIT REQUIREMENTS:
  - Return is a Hash:
    - The keys are symbols
    - Each key is from each letter in the input_string
    - The value of each pair is an array
    - Inside the value array is the index number at which the letter_key appears in the input_string
  - The entry order of the key-value pairs is the same as the letters in the string
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Hash

key = symbol (letter)
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.
2.
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using a simple loop

# def map_letters(input_string)
#   hash = {}
#   string_index_counter = 0
  
#   loop do
#     symbol = input_string[string_index_counter].to_sym
    
#     if hash.include?(symbol)
#       hash[symbol] << string_index_counter
#     else
#       hash[symbol] = [string_index_counter]
#     end
    
#     string_index_counter += 1
#     break if string_index_counter == input_string.size
#   end
  
#   hash
# end

# -------------------

# solution 2 - Using #each_with_object

def map_letters(input_string)
  array = input_string.chars
  
  hash = array.each_with_object({}) do |letter, hash|
    hash[letter.to_sym] = []
  end
  
  array.each_with_index do |letter, i|
    symbol = letter.to_sym
    # binding.pry
    hash[symbol] << i
  end
  hash
end

# -------------------

# Print Tests
p map_letters("froggy")

# Test Cases
p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }