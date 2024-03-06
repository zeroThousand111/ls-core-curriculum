=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

INPUT: an Array of Integers

OUTPUT: an Integer

RULES
EXPLICIT REQUIREMENTS:
  - don't use Array#sum
  - arrays never empty
  - Integers always positive
  
IMPLICIT REQUIREMENTS:
  - Integers not in any order
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

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


1.CREATE local variable to track the sum
  a.
    i.sum = 0
2.DETERMINE the number of elements in the array 
  a.Array#size
    i.
3.MOVE through the array adding each Integer to `sum` until all added
  a.a simple loop
  b.a FOR loop
  c.#each
  d.sum += value
  e.stop when array.size
    i.
4.CALCULATE average and RETURN
  a.average is sum divided by number of elements
    i. sum / array.size
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop to iterate

def average(array)
  sum = 0
  no_of_elements = array.size
  
  index = 0
  loop do 
    sum += array[index]
    index += 1
    break if index == no_of_elements
  end
  
  sum / no_of_elements
end

# -------------------

# solution 2 - using a FOR loop

def average(array)
  sum = 0
  no_of_elements = array.size
  
  for element in array
    sum += element
  end
  
  sum / no_of_elements
end

# -------------------

# solution 3 - using #each

def average(array)
  sum = 0
  no_of_elements = array.size
  array.each { |element| sum += element }
  sum / no_of_elements
end

# -------------------

# solution 4 - using #inject and being smart ass

def average(array)
  array.inject(:+) / array.size
end

# -------------------

# solution 5 - FURTHER EXPLORATION - accepting float values

def average(array)
  array.inject { |sum, element| sum + element.to_f } / array.size
end

# -------------------

# Print Tests

# Test Cases
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# FURTHER EXPLORATION test cases
puts average([1, 6]) == 3.5
puts average([5.5, 6.25, 4.75]) == 5.5