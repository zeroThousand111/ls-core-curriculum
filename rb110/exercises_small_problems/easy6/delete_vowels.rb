=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  An array of strings
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  An array of strings
  
Explicit reqs:
  # What does the problem say about what you should do?
  - write a method;
  - remove vowels from the strings in the input array.
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - return AN array not THE array;
  - the elements in the array of strings may be single characters or multi-character words;
  - elements should be preserved, not deleted if they are all vowels
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
  remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
  remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  An array of strings
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  Two options:
  1. Create a new array and then select those elements of the input array that should be copied across to it; or
  2. Create a duplicate of the calling object array and then remove the vowels from each string within it.
  
  1. Select Minus Vowels
    a. Loop through the array of strings
    b. Loop through each character of each string
    c. Select non-vowels (consonants) of each string
    d. Create new array of strings from new strings
  2. Delete Vowels from Duplicate
    a. Create a duplicate of input array
    b. Iterate through each string of copied array and delete every vowel.
    
________________________________________________________________________________
Time to code!
=end

# solution 1a: Select Minus Vowels using Two Nested Loops and String#match?(/[^AEIOUaeiou]/)

# def remove_vowels(input_array)
#   element = 0
#   output_array = []
#   loop do
    
#     input_word = input_array[element]
#     output_word = ''
#     counter = 0
    
#     loop do
#       char = input_word[counter]
#       output_word << input_word[char] if char.match?(/[^AEIOUaeiou]/)
#       counter += 1
#       break if counter == input_word.size
#     end
    
#     output_array << output_word
#     element += 1
#     break if element == input_array.size
#   end
#   output_array
# end

# solution 1b: Select Minus Vowels Using Each Iteration and  String#match?

# def remove_vowels(input_array)
#   new_array = []
#   input_array.each do |string|
#     new_string = string.chars.select do |char|
#       char.match?(/[^AEIOUaeiou]/)
#     end.join
#     new_array << new_string
#   end
#   new_array
# end


# solution 2: Delete using String#gsub!

# def remove_vowels(input_array)
#   output_array = input_array.dup
#   output_array.each do |string|
#     string.gsub!(/[aeiouAEIOU]/, '')
#   end
# end

# solution 3: Official LS Solution using Array#map and String#delete

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

# print tests
p remove_vowels(%w(green YELLOW black white)) # %w(grn YLLW blck wht)

# test cases
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']