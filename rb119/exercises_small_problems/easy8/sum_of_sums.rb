=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

INPUT: An array of numbers

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - assume that the Array always contains at least one number
  -
  -
  
IMPLICIT REQUIREMENTS:
  - an array of just one number may be tricky!
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

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


1.CREATE a sum variable
  a.
    i.
2.ADD the value of the element at index[0] to sum variable
  a.
    i.
3.ADD the values of the elements at indices[0] to [1] to the sum variable
  a.
    i.
4.CONTINUE expanding the index range until the range extends to the whole array i.e. until the end of the index == array.size
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

# solution 1 - using a simple loop

def sum_of_sums(array)
  sum = 0
  length = 1

  loop do
    sum += array[0, length].sum
    length += 1
    break if length == array.size + 1
  end
  
  sum
end

# -------------------

# solution 2 - using a different algorithm - index[0] is added array.size times to sum, index[1] is added array.size -1 times, etc

def sum_of_sums(array)
  sum = 0
  index = 0
  multiple_factor = array.size

  loop do
    sum += array[index] * multiple_factor
    index += 1
    multiple_factor -= 1
    break if index == array.size
  end
  sum
end

# -------------------

# solution 3 - as solution 2 but using a FOR loop to iterate

def sum_of_sums(array)
  sum = 0
  multiple_factor = array.size
  
  for num in array
    sum += num * multiple_factor
    multiple_factor -= 1
  end
  
  sum
end


# -------------------

# solution 4 - as solution 2 but using #each

def sum_of_sums(array)
  sum = 0
  multiple_factor = array.size
  
  array.each do |num|
    sum += num * multiple_factor
    multiple_factor -= 1
  end
  
  sum
end

# -------------------

# solution 5 - Official LS solution using an accumulator for each 'pass'

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num 
    sum_total += accumulator
  end

  sum_total
end

# -------------------

# Print Tests

# Test Cases
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35