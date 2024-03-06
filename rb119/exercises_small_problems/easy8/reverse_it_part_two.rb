=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

INPUT: a String

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - string will contain one or more words, i.e. not empty
  - words with five or more characters will be reversed
  - only include spaces when more than one word is present (a function of String#split to remove trailing and leading whitespace)
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a new empty string
  a.
    i.
2.SPLIT the string into words
  a.
    i.
3.MEASURE EACH word length
  a.
    i.
4.IF word is five or more than characters long, reverse it
  a.
    i.
5.COPY word (reversed or otherwise) to new string in same order
  a.
    i.
6.RETURN new string
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

# solution 1 - using a simple loop

def reverse_words(string)
  output_array = []
  input_array = string.split(' ')
  
  index = 0
  loop do 
    if input_array[index].length >= 5
      output_array << input_array[index].reverse
    else
      output_array << input_array[index]
    end
    index += 1
    break if index == input_array.size
  end
  
  output_array.join(' ')
end

# -------------------

# solution 2 - using #each

def reverse_words(string)
  output_array = []
  input_array = string.split(' ')
  input_array.each do |word|
    if word.length >= 5
      output_array << word.reverse
    else
      output_array << word
    end
  end
  
  output_array.join(' ')
end

# -------------------

# solution 3 - using #map

def reverse_words(string)
  string.split(' ').map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

# -------------------

# solution 4 - using #map and ternary operator

def reverse_words(string)
  string.split(' ').map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Test Cases
puts reverse_words('Professional')          == 'lanoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')         == 'hcnuaL loohcS'