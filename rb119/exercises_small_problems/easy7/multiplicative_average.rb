=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

INPUT: An array of integers

OUTPUT: A float, rounded to 3 d.p.

RULES
EXPLICIT REQUIREMENTS:
  - Assume the array is not empty
  - output is sum of array divided by number of array elements
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a sum variable
  a.
    i.
2.CREATE an average variable
  a.
    i.
3.MUTLIPLY the values of the integers in the array
  a.
    i.
4.DIVIDE the sum by the number of elements to calculate the average
  a.
    i.
5.ROUND the average value to 3 decimal places
  a.
    i.
6.FORMAT the output to 3 decimals to include up to 3 trailing zeroes
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - 

def show_multiplicative_average(array)
  average = array.inject(&:*).to_f / array.size
  puts "The result is #{sprintf('%.2f', average.round(3))}"
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667