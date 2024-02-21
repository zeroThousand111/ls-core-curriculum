=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

INPUT: An array of strings

OUTPUT: A new array of strings

RULES
EXPLICIT REQUIREMENTS:
  - vowels (a, e, i, o, u) removed
  -
  -
  
IMPLICIT REQUIREMENTS:
  - letters can be uppercase or lowercase
  - a string composed of vowels still must be returned as an empty string (not no string at all)
  - is the original string to be preserved, or can it be mutated?  I'll assume that it needs to be preserved

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

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


1.CREATE NEW array
  a. 
    i.new_array = []
2.EXAMINE each string in the array of strings
  a.Use #each to iterate over the array of strings
  b.Use #map to directly create a new array? - No because EVERY character will be mapped, even vowels (which will be given as `nil` in the new string)
    i.
3.EXAMINE each character in the string
  a.Use a simple loop to iterate through the string
  b.Break the string into characters THEN
    i. String#chars
  c.
4.CHECK if each character is a vowel or non-vowel (many options)
  a. Use String.include? (string in a string argument) - no because a non-liner string pattern i.e. a, e, i o, u and A, E, I, O, U
  b. Use String#~= method (truthy means included, falsy means absent)
  c. Use String#match? (regex argument)
  d. Use String#count (character selector argument)
  e. Use String#delete (character selector argument)
    i.string.delete('aeiouAEIOU')
5.BUILD a new String
  a.
    i.new_string = ''
6.PUSH character to new String if the character is a non-vowel, don't if not
  a. 
    i.new_string << char
7.PUSH new_string to new array
  a.
    i.new_array << new_string

______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using simple nested loops to iterate through each string and each character

# def remove_vowels(array_of_strings)
#   new_array_of_strings = []
  
#   array_index = 0
#   loop do # each string loop
#     string_index = 0
#     new_string = ''
    
#     loop do # each character loop
#       character = array_of_strings[array_index][string_index]
#       new_string << character if character.match?(/[^aeiouAEIOU]/)
#       string_index += 1
#       break if string_index == array_of_strings[array_index].length
#     end
#     new_array_of_strings << new_string 
#     array_index += 1
#     break if array_index == array_of_strings.length
#   end
    
#   new_array_of_strings
# end

# -------------------

# solution 2 - Using #each and #chars

# def remove_vowels(array_of_strings)
#   new_array_of_strings = []
  
#   array_of_strings.each do |string|
#     new_string = ''
#     string.chars.each do |char|
#       new_string << char if char.match?(/[^aeiouAEIOU]/)
#     end
#     new_array_of_strings << new_string
#   end
    
#   new_array_of_strings
# end

# -------------------

# solution 3 - Using #map with a helper method

# def return_cleaned_string(string)
#   new_string = ''
#   string.chars.each do |char|
#       new_string << char if char.match?(/[^aeiouAEIOU]/)
#     end
#   new_string
# end

# def remove_vowels(array_of_strings)
#   array_of_strings.map do |string|
#     return_cleaned_string(string)
#   end
# end

# -------------------

# solution 4 - Using #map with String#gsub (still doesn't mutate the original array of strings because it is #map)

def remove_vowels(array_of_strings)
  array_of_strings.map do |string|
    string.gsub(/[aeiouAEIOU]/, '')
  end
end

# -------------------

# solution 5 - Official LS solution (similar to my no 4 but with String#delete)

# def remove_vowels(strings)
#   strings.map { |string| string.delete('aeiouAEIOU') }
# end

# -------------------

# Print Tests
p remove_vowels(%w(ABC AEIOU XYZ)) # ['BC', '', 'XYZ']

# Test Cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']