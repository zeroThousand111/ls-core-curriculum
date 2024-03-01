=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

INPUT: a string

OUTPUT: a NEW string

RULES
EXPLICIT REQUIREMENTS:
  - every uppercase letter is replaced by a lowercase version
  - every lowercase letter is replaced by a uppercase version
  - You may not use String#swapcase
  
IMPLICIT REQUIREMENTS:
  - whitespace is allowed in input string
  - non-letters are allowed in input string
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays could be used

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.



1.EXAMINE EACH letter in turn
  a.Could use a simple loop to iterate
  b.Could transform string to an array of characters
  c.Could use #each_char to iterate
    i.
2.DETERMINE if the letter is uppercase or lowercase or neither
  a.Could use #match?
  b.Could use #include?
  c.
    i.
3.CREATE new string
  a.Create empty string
    i.new_string = ""
  b.Use #map on array of characters to return new array
  
4.TRANSFORM letter into it's opposite case
  a.Could use #upcase and #downcase as appropriate
  b.Could use a Hash of characters
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate through string and build a new string with selective use of #upcase and #downcase

def swapcase(string)
  new_string = ""
  
  index = 0
  loop do
    if string[index].match?(/[A-Z]/)
      new_string << string[index].downcase
    elsif string[index].match?(/[a-z]/)
      new_string << string[index].upcase
    else 
      new_string << string[index]
    end
    index += 1
    break if index == string.length
  end
  
  new_string
end

# -------------------

# solution 2 - Refactor of above using String#each_char to iterate

def swapcase(string)
  new_string = ""
  string.each_char do |char|
    if char.match?(/[A-Z]/)
      new_string << char.downcase
    elsif char.match?(/[a-z]/)
      new_string << char.upcase
    else 
      new_string << char
    end
  end
  
  new_string
end

# -------------------

# solution 3 - Using a hash of uppercase and lowercase alphabet characters then building new_string using hash element assignment 

# def create_hash
#   uppercase_array = ('A'..'Z').to_a
#   uppercase_array.each_with_object({}) do |letter, hash|
#     hash[letter] = letter.downcase
#   end
# end

# CASES = create_hash

# def swapcase(string)
#   new_string = ""
#   string.each_char do |char|
#     if char.match?(/[A-Z]/)
#       new_string << CASES[char]
#     elsif char.match?(/[a-z]/)
#       new_string << CASES.key(char)
#     else 
#       new_string << char
#     end
#   end
  
#   new_string
# end

# -------------------

# solution 4 - Using the same hash but using #map to create a new string

def create_hash
  uppercase_array = ('A'..'Z').to_a
  uppercase_array.each_with_object({}) do |letter, hash|
    hash[letter] = letter.downcase
  end
end

CASES = create_hash

def swapcase(string)
  string.each_char.map do |char|
    if char.match?(/[A-Z]/)
      CASES[char]
    elsif char.match?(/[a-z]/)
      CASES.key(char)
    else 
      char
    end
  end.join
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p swapcase('Tonight on XYZ-TV') # 'tONIGHT ON xyz-tv'

# Test Cases
p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'