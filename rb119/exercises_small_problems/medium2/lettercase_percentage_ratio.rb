=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

INPUT: a string

OUTPUT: a Hash of three key-value pairs (%lowercase, %uppercase, %neither)

RULES
EXPLICIT REQUIREMENTS:
  - A method
  - Assume a string always has one or more characters (i.e. no empty strings)
  -
  
IMPLICIT REQUIREMENTS:
  - neither category can include whitespace and numbers and symbols
  - will need to define what is a letter first (either by reference data structure or using Regex)
______________________________________________________________________________
Further Exploration
If we passed a string 'abcdefGHI' as an argument to our method call the solution would be {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}. It would be nicer if we could round these float numbers so that our solution looks like this {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}. Try creating that solution on your own.

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE the output hash
  a.
    i.hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
2.CREATE three local variables to tally counts and set values to zero
3.MOVE through the string for EACH character
  a.Use a simple loop
  b.Use #each_char
    i.
4.CATEGORISE the next character and update tally
  a.
    i.
5.
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

# solution 1 - using Regex and String#match? to categorise characters

def calc_percentage(string, count)
  divisor = string.length.to_f
  (count / divisor) * 100
end

# def letter_percentages(string)
#   tally_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  
#   string.each_char do |char|
#     if char.match?(/[a-z]/)
#       tally_hash[:lowercase] += 1
#     elsif char.match?(/[A-Z]/)
#       tally_hash[:uppercase] += 1
#     else
#       tally_hash[:neither] += 1
#     end
#   end

#   { 
#     lowercase: calc_percentage(string, tally_hash[:lowercase]), 
#     uppercase: calc_percentage(string, tally_hash[:uppercase]), 
#     neither: calc_percentage(string, tally_hash[:neither])
#   }
# end

# -------------------

# solution 2 - using reference arrays and Array#include? 

# UPPERCASE = ("A".."Z").to_a
# LOWERCASE = ("a".."z").to_a

# def letter_percentages(string)
#   tally_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  
#   string.each_char do |char|
#     if LOWERCASE.include?(char)
#       tally_hash[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       tally_hash[:uppercase] += 1
#     else
#       tally_hash[:neither] += 1
#     end
#   end
  
#   { 
#     lowercase: calc_percentage(string, tally_hash[:lowercase]), 
#     uppercase: calc_percentage(string, tally_hash[:uppercase]), 
#     neither: calc_percentage(string, tally_hash[:neither])
#   }
# end

# -------------------

# solution 3 - using local variables as tallies instead and 

def letter_percentages(string)
  lowercase = 0
  uppercase = 0
  neither = 0
  
  string.each_char do |char|
    if char.match?(/[a-z]/)
      lowercase += 1
    elsif char.match?(/[A-Z]/)
      uppercase += 1
    else
      neither += 1
    end
  end
  
  { 
    lowercase: calc_percentage(string, lowercase), 
    uppercase: calc_percentage(string, uppercase), 
    neither: calc_percentage(string, neither)
  }
end

# -------------------

# solution 4 - FURTHER EXPLORATION

def calc_percentage(string, count)
  divisor = string.length.to_f
  ((count / divisor) * 100).round(1)
end

def letter_percentages(string)
  lowercase = 0
  uppercase = 0
  neither = 0
  
  string.each_char do |char|
    if char.match?(/[a-z]/)
      lowercase += 1
    elsif char.match?(/[A-Z]/)
      uppercase += 1
    else
      neither += 1
    end
  end
  
  { 
    lowercase: calc_percentage(string, lowercase), 
    uppercase: calc_percentage(string, uppercase), 
    neither: calc_percentage(string, neither)
  }
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p letter_percentages('abCdef 123') # { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

# Test Cases
# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# FURTHER EXPLORATION TEST CASE
p letter_percentages('abcdefGHI') #{:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}
p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0 }