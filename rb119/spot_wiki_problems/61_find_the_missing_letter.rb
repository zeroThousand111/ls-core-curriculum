=begin

61. Find the missing letter
(​https://www.codewars.com/kata/5839edaa6754d6fec10000a2​) 
6 kyu

#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

# UNDERSTAND THE PROBLEM
## INPUT: an array of alphabetic characters
## OUTPUT: a string, the missing alphabetic character
## RULES
### EXPLICIT REQUIREMENTS
  - a method;
  - argument is an array of consecutive and increasing letters
  - return is the missing letter in the sequence
  - length of array will always be 2
  - letters will always be of one case only (but can be either upper or lower)
  
### IMPLICIT REQUIREMENTS
  - English alphabet aka Roman alphabet with 26 letters
  - "consecutive" means in a sequence
  - "increasting" means increasing alphabetic order (i.e. towards 'z')

# EXAMPLES / TEST CASES

Example:
['a','b','c','d','f'] -> 'e' 
['O','Q','R','S'] -> 'P'

(Use the English alphabet with 26 letters!)
Have fun coding it and please don't forget to vote and rank this kata! :-)
I have also created other katas. Take a look if you enjoyed this kata! 

# DATA STRUCTURES
Input: an array of strings
  - the strings are in increasing alphabetic order
Output: a string character
Intermediate:
 - perhaps two reference arrays of lower case alphabetic chars from 'a' to 'z' and an array of upper case chars from 'A' to "Z"

# ALGORITHM
## HIGH LEVEL
1. Determine if the input array has uppercase or lowercase letters and so choose which reference array to use
2. Find the first element of the input array in the appropriate uppercase or lowercase reference array to match them
3. Move up the array (and alphabet) checking if the next element in the input array is the expected letter
4. If the next letter is not the expected letter, return what the expected letter would be

1. Determine if the input array has uppercase or lowercase letters and so choose which reference array to use
* CREATE two reference arrays, one uppercase, one lowercase
  + use a range and #to_a
* INVOKE #downcase! on the first element and determine the truthiness of the result
  + #downcase! on an already downcase element will return `nil` (falsy), whereas an uppercase letter will return a lowercase letter, which is truthy
  + use !! in front of expression to return boolean true or false
    - !!input_array[0].downcase!
* CHOOSE which reference array to use for the rest of the method invocation

2. Find the first element of the input array in the appropriate uppercase or lowercase reference array to match them
* Find the index (in the ref array) of the first element of the input array
  + use #index
    - reference_array.index(input_array[0])
* Assign this index to `current_index`
3. Move up the array (and alphabet) checking if the next element in the input array is the expected letter
* MOVE up the reference array from the current index to the last index (but STOP when a missing letter found)
  + use #upto
* TRACK index of input array
  + start at index 1 and increment by 1 on each iteration of #upto

  
4. If the next letter is not the expected letter, return what the expected letter would be
* COMPARE input_array[input_index] with reference_array[ref_index]
  + IF they are the same, that's expectd, move on
  + ELSE return the letter in the reference array, that's the missing letter

=end

require 'pry'
require 'pry-byebug'

# ---
# this step was not needed - just use one reference array with both uppercase and lowercase letters in it ("A".."z".to_a)

# def is_uppercase(input_array)
#   !!input_array[0].downcase! # but this mutates the input_array, which will cause issues later
# end

# def choose_reference_array(input_array)
#   uppercase_ref = ("A".."Z").to_a
#   lowercase_ref = ("a".."z").to_a
#   if is_uppercase(input_array)
#     reference_array = uppercase_ref
#   else
#     reference_array = lowercase_ref
#   end
#   reference_array
# end
# ---

def missing_letter(input_array)
  reference_array = ("A".."z").to_a
  current_index = reference_array.index(input_array[0])
  
  input_index = 1
  (current_index + 1).upto(51) do |ref_index| # two alphabets 26*2
    if input_array[input_index] != reference_array[ref_index]
      return reference_array[ref_index]
    end
    input_index += 1
  end
  
end

p missing_letter(['a','b','c','d','f']) == 'e'
p missing_letter(['O','Q','R','S']) == 'P'