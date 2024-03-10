=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

INPUT: An Array of Integers

OUTPUT: An Array of Integers

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - I'm assuming the return is a NEW array
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a local variable to track the running total
  a.
    i.
2.CREATE a new array to return
  a.
    i.
3.MOVE element by element through the input array
  a.Could use a simple loop
  b.Could use #each
  c.Could use a For loop
  d.Could use #map to create the new array and move through input array at the same time
    i.
4.ADD next element value to the running total
  a.
    i.
5.COPY running total to output array
  a.
    i.
6.RETURN final array
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate

def running_total(input_array)
  running_total = 0
  output_array = []
  return output_array if input_array.empty?
  
  index = 0
  loop do
    running_total += input_array[index]
    output_array << running_total
    index += 1
    break if index == input_array.size
  end
  
  output_array
end
# -------------------

# solution 2 - using a For loop to iterate

def running_total(input_array)
  running_total = 0
  output_array = []
  return output_array if input_array.empty?
  
  for num in input_array
    running_total += num
    output_array << running_total
  end
  
  output_array
end

# -------------------

# solution 3 - using #each

def running_total(input_array)
  running_total = 0
  output_array = []
  return output_array if input_array.empty?
  
  input_array.each do |num|
    running_total += num
    output_array << running_total
  end
  
  output_array
end

# -------------------

# solution 4 - using #map

def running_total(input_array)
  input_array.map.with_index { |num, index| input_array[0..index].sum }
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p running_total([2, 5, 13]) # [2, 7, 20]

# Test Cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []