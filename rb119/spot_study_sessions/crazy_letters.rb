=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

word = 'what-a-b.e.a.utiful day!'

# Your Code Here

p crazy_letters(word) #== ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']

INPUT: A string

OUTPUT: An array of string characters

RULES
EXPLICIT REQUIREMENTS:
  - None!
  -
  -
  
IMPLICIT REQUIREMENTS:
  - Return is an array
  - Array has only letters from original string input, no other characters
  - string elements alternate downcase and upcase
    - those elements at odd indexes are upcased
    - those elements at zero and even indexes are downcased
  - no whitespace in input string
  - all letters downcased in input string

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

See problem

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


1.REMOVE non letter characters
  a.Use String#delete
    i.clean_string = string.delete(^'A-Za-z')
2.CONVERT cleaned string to an array
  a.
    i.
3.CHANGE string elements at odd numbered indexes to upcased characters
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

word = 'what-a-b.e.a.utiful day!'

# solution 1 - Using a simple loop

# def crazy_letters(string)
#   clean_string = string.delete('^A-Za-z')
#   array = clean_string.chars
  
#   index = 0
#   loop do
#     array[index] = array[index].upcase if index.odd? 
#     index += 1
#     break if index == clean_string.length
#   end
#   array
# end

# -------------------

# solution 2 - Using Enumerable#each_with_index and String#upcase!

# def crazy_letters(string)
#   clean_string = string.delete('^A-Za-z')
#   array = clean_string.chars
  
#   array.each_with_index do |element, index|
#     if index.odd? 
#       element = element.upcase!
#     end
#   end
  
#   array
# end

# -------------------

# solution 3 - Using #map and an alternating 'flipper'

# def crazy_letters(string)
#   array = string.delete('^A-Za-z').chars
#   flipper = false
#   array.map do |element|
#     if flipper
#       flipper = !flipper
#       element.upcase
#     else
#       flipper = !flipper
#       element
#     end
#   end
# end

# -------------------

# solution 4 - Using #map and index

def crazy_letters(string)
  array = string.delete('^A-Za-z').chars
  array.map.with_index do |element, index|
    if index.odd? 
      element = element.upcase!
    else
      element
    end
  end
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p crazy_letters(word) #== ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']

# Test Cases
p crazy_letters(word) == ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']