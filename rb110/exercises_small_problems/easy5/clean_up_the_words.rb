=begin
________________________________________________________________________________
*****Problem*****

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:
cleanup("---what's my +*& line?") == ' what s my line '
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  A String of some words and random non-alphabetic characters
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  A String with the same words as the input, but with non-alphabetic characters replaced with spaces.  The result should never have consecutive spaces.
  
Explicit reqs:
  # What does the problem say about what you should do?
  
  - Write a method
  - remove non-alphabetic characters from input string and replace with spaces
  - ensure no two spaces are together
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - The problem does not say if the original string needs to be destructively changed, or a new string returned;
  - 
________________________________________________________________________________
*****Examples/Test cases*****

cleanup("---what's my +*& line?") == ' what s my line '

________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  An Array of characters
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  1. Iterate through the input string character by character;
  2. If the character is not an alphabetic character, replace it with a space " "
  3. Iterate through the modified string and replace all sub-strings that have more than one space with just one space
     a. Identify those sub-strings containing more than one " "
     b. Remove each additional " " beyond the first " "
  4. Return cleaned up string
________________________________________________________________________________
Time to code!
=end

# ----

# solution 1: Simple loop, Complicated solution!

# def cleanup(string)
#   array_of_chars = string.chars
#   counter = 0
  
#   # replace non-alphabetic characters with " "
#   loop do
#     array_of_chars[counter].gsub!(/[^a-zA-Z]/, ' ')
#     counter += 1
#     break if counter == array_of_chars.size
#   end
  
#   counter = 0

#   # Detect and delete different combinations of multiple spaces 
#   loop do
#     if array_of_chars[counter] == ' ' && array_of_chars[counter + 1] == ' ' && array_of_chars[counter + 2] == ' ' && array_of_chars[counter + 3] == ' ' && array_of_chars[counter + 4]
#       array_of_chars.delete_at(counter + 4)
#       array_of_chars.delete_at(counter + 3)
#       array_of_chars.delete_at(counter + 2)
#       array_of_chars.delete_at(counter + 1)
#     elsif array_of_chars[counter] == ' ' && array_of_chars[counter + 1] == ' ' && array_of_chars[counter + 2] == ' ' && array_of_chars[counter + 3] == ' '
#       array_of_chars.delete_at(counter + 3)
#       array_of_chars.delete_at(counter + 2)
#       array_of_chars.delete_at(counter + 1)
#     elsif array_of_chars[counter] == ' ' && array_of_chars[counter + 1] == ' ' && array_of_chars[counter + 2] == ' '
#       array_of_chars.delete_at(counter + 2)
#       array_of_chars.delete_at(counter + 1)
#     elsif array_of_chars[counter] == ' ' && array_of_chars[counter + 1] == ' '
#       array_of_chars.delete_at(counter + 1)
#     end
#     counter += 1
#     break if counter == array_of_chars.size
#   end
  
#   array_of_chars.join
# end

# p cleanup("---what's my +*& line?")

# p cleanup("---what's my +*& line?") == ' what s my line '

# white space clean up tests

# p cleanup("++  ++")    # "++ ++" 2
# p cleanup("++   ++")   # "++ ++" 3
# p cleanup("++    ++")  # "++ ++" 4

# ----

# solution 2: String#gsub iterates through the string!

# def cleanup(string)
  
#   # replace non-alphabetic characters with " "
#   removed_non_alpha = string.gsub(/[^a-zA-Z]/, ' ')
  
#   # Detect and delete different combinations of multiple spaces
#   removed_non_alpha.squeeze(" ")
# end 

# solution 3: LS Solution 1

# ALPHABET = ('a'..'z').to_a

# def cleanup(text)
#   clean_chars = []

#   text.chars.each do |char|
#     if ALPHABET.include?(char)
#       clean_chars << char
#     else
#       clean_chars << ' ' unless clean_chars.last == ' '
#     end
#   end

#   clean_chars.join
# end

# solution 4: LS Solution 2

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# tests
p cleanup("---what's my +*& line?")

p cleanup("---what's my +*& line?") == ' what s my line '