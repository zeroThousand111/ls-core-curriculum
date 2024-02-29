=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

INPUT: a string

OUTPUT: a hash containing three keysL lowercase, uppercase and neither

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - keys are symbols
  - string can contain letters, numbers, characters and whitespace
  - string can be empty
  - 

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a new hash containing three keys
  a.
    i.hash = {lowercase: 0, uppercase: 0, neither: 0}
2.CATEGORISE first character of string and increment hash counter
  a.IF character is lowercase letter, increment lowercase
    i.string[0].match?(/[a-z]/)
  b.IF character is upppercase letter, increment uppercase
    i.string[0].match?(/[A-Z]/)
  c.IF character is neither, increment neither
    i.string[0].match?(/[^a-zA-Z]/)
3.
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate through the string

def letter_case_count(string)
  hash = {lowercase: 0, uppercase: 0, neither: 0}
  return hash if string.empty?
  index = 0
  loop do
    if string[index].match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif string[index].match?(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
    index += 1
    break if index == string.length
  end
  hash
end

# -------------------

# solution 2 - using String#each_char to iterate through the string

def letter_case_count(string)
  hash = {lowercase: 0, uppercase: 0, neither: 0}
  
  string.each_char do |char|
    if char.match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  
  hash
end

# -------------------

# solution 3 - Using count to count whole string and categorise and build hash by hash element assignment

def letter_case_count(string)
  hash = {}
  hash[:lowercase] = string.count('a-z')
  hash[:uppercase] = string.count('A-Z')
  hash[:neither] = string.count('^A-Za-z')
  
  hash
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p letter_case_count('abCdef 123') #{ lowercase: 5, uppercase: 1, neither: 4 }

# Test Cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }