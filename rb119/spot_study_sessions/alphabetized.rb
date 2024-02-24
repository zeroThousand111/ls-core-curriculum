=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.

The input is restricted to contain no numerals and only words containing the english alphabet letters.

INPUT: A string
  - has letters, both uppercase and lowercase
  - has white space
  - has non-letter characters

OUTPUT: A string
  - only has letters, no whitespace and no non-letter characters
  - letters remain unchanged as uppercase or lowercase
  - letters are all present in the string, but are in a sorted alphabetical order

RULES
EXPLICIT REQUIREMENTS:
  - "concatenated"
  -
  -
  
IMPLICIT REQUIREMENTS:
  - a new string or mutated input string?  I'll go with the former
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

p alphabetized("The Holy Bible") == "BbeehHilloTy"

p alphabetized("!@$%^&*()_+=-`,") == ""

p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Strings, maybe arrays?
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.REMOVE non-letter characters and whitespace from the input string
  a.String#delete is an option
  b.String#gsub is also an option (regex needed)
    i.
2.CREATE a hash of keys made of lowercase letters in alphabetic order with values according to their number in the alphabet
  a.
    i.
3.CREATE an array of characters from the cleaned string
  a.
    i.
4.SORT the elements in the array
  a.The method Array#sort will NOT give the result we want, because sorting by pure ASCII number creates differences in uppercase and lowercase
  b.We need another way of putting letters in order: one way would be to create a Hash of lowercase letters
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# create Hash of lowercase letters assigned to increasing values
ALPHABET = {}
array = ('a'..'z').to_a
0.upto(25) { |n| ALPHABET[array.shift] = n }

# solution 1 - using String#gsub

# def alphabetized(input_string)
#   cleaned_string = input_string.gsub(/[^A-Za-z]/, '')
#   sorted_string = cleaned_string.chars.sort_by do |char|
#                     ALPHABET[char.downcase]
#                   end.join
#   sorted_string                
# end

# -------------------

# solution 2 - Above refactored to be smart-ass

# def alphabetized(input_string)
#   input_string.gsub(/[^A-Za-z]/, '').chars.sort_by do |char|
#                                                     ALPHABET[char.downcase]
#                                                   end.join
# end

# -------------------

# solution 3 - Above but using String#delete

def alphabetized(input_string)
  input_string.delete('^A-Za-z').chars.sort_by do |char|
                                                     ALPHABET[char.downcase]
                                                   end.join
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p alphabetized("The Holy Bible") # "BbeehHilloTy"
# p alphabetized("!@$%^&*()_+=-`,") # ""
# p alphabetized("CodeWars can't Load Today") # "aaaaCcdddeLnooorstTWy"

# Test Cases
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"