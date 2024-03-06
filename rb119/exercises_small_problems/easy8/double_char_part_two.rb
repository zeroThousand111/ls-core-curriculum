=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a new string
  a.
    i.
2.MOVE through the input string
  a.
    i.
3.CHECK if the next character is a consonant
  a.
    i.
4.COPY two characters of the character to the new string IF the character is a consonant
  a.
    i.
5.COPY one character if not
  a.
    i.
6.RETURN the new string
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a loop to iterate

def double_consonants(string)
  new_string = ""
  return new_string if string.empty?
  
  index = 0
  loop do
    # binding.pry
    if string[index].downcase.count('bcdfghjklmnpqrstvwxyz') == 1
      new_string << string[index] << string[index]
    else
      new_string << string[index]
    end
    index += 1
    break if index == string.length
  end
  new_string
end

# -------------------

# solution 2 - 

def double_consonants(string)
  new_string = ""
  return new_string if string.empty?
  
  string.each_char do |char|
    if char.downcase.count('bcdfghjklmnpqrstvwxyz') == 1
      new_string << char << char
    else
      new_string << char
    end
  end
  
  new_string
end

# -------------------

# solution 3 - using #map

def double_consonants(string)
  return "" if string.empty?
  
  string.chars.map do |char|
    if char.downcase.count('bcdfghjklmnpqrstvwxyz') == 1
      char * 2
    else
      char
    end
  end.join
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""