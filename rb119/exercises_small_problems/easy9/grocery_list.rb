=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

INPUT: an Array of strings and Integers

OUTPUT: an Array of strings

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

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
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

# solution 1 - 

def buy_fruit(input_array)
  output_array = []
  input_array.each do |subarray|
    subarray[-1].times do
      output_array << subarray[0]
    end
  end
  output_array
end

# -------------------

# solution 2 - refactor above with #first and #last

def buy_fruit(input_array)
  output_array = []
  input_array.each do |subarray|
    subarray.last.times do
      output_array << subarray.first
    end
  end
  output_array
end

# -------------------

# solution 3 - using #map

def buy_fruit(input_array)
  input_array.map do |item, quantity|
    [item]* quantity
  end.flatten
end



# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

# Test Cases
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]