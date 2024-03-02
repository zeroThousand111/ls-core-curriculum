=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

INPUT: A string

OUTPUT: a NEW string

RULES
EXPLICIT REQUIREMENTS:
  - every other character is capitalized
  - remaining characters are lowercase
  - Characters that are not letters should not be changed
  
IMPLICIT REQUIREMENTS:
  - In other words, letters at indexes with even numbers are capitalised
  - Letters at indexes with odd numbers are lowercase
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CHECK each character in input string
  a.Simple loop
  b.Iterate
    i.
2.DETERMINE if character is a letter
  a.
    i.
3.CREATE NEW string
  a.Create empty string
  b.Or use #map on array of string characters
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

# solution 1 - using simple loop and building new string

def staggered_case(string)
  new_string = ""
  
  index = 0
  loop do
    if string[index].match?(/[A-Za-z]/)
      if index.odd?
        new_string << string[index].downcase
      else
        new_string << string[index].upcase
      end
    else
      new_string << string[index]
    end
    index += 1
    break if index == string.length
  end
  new_string
end

# -------------------

# solution 2 - refactor above using Array#chars.with_index

def staggered_case(string)
  new_string = []
  string.chars.each_with_index do |char, index|
    if char.match?(/[A-Za-z]/)
      if index.odd?
        new_string << char.downcase
      else
        new_string << char.upcase
      end
    else
      new_string << char
    end
  end
  new_string.join
end

# -------------------

# solution 3 - using #map.with_index

def staggered_case(string)
  string.chars.map.with_index do |char, index|
    if char.match?(/[A-Za-z]/)
      if index.odd?
        char.downcase
      else
        char.upcase
      end
    else
      char
    end
  end.join
end

# -------------------

# solution 4 - FURTHER EXPLORATION

def staggered_case_fe(string, start='caps')
  new_string = ""
  
  index = 0
  loop do
    if string[index].match?(/[A-Za-z]/)
      if start == 'caps'
        if index.odd?
          new_string << string[index].downcase
        else
          new_string << string[index].upcase
        end
      elsif start == 'reverse'
        if index.even?
          new_string << string[index].downcase
        else
          new_string << string[index].upcase
        end
      end
    else
      new_string << string[index]
    end
    index += 1
    break if index == string.length
  end
  new_string
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Test Cases for Further Exploration

p staggered_case_fe('ALL_CAPS') == 'AlL_CaPs'
p staggered_case_fe('ALL_CAPS', 'reverse') == 'aLl_cApS'