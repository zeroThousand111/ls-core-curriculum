=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

INPUT: An Integer (referring to the number of digits)

OUTPUT: An Integer (referring to the index number in the Fibonacci sequence)

RULES
EXPLICIT REQUIREMENTS:
  - You may assume that the argument is always greater than or equal to 2.
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Maybe arrays can be used
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


STRATEGY A - Create next number in sequence in turn and CHECK each time if it is n digits long

STRATEGY B - Create next number in sequence UNTIL it is n digits long then return index number

1.CREATE an index counter and set to 2
  a.
    i.
2.CALCULATE next number in the Fibonnaci series and increment index counter
  a.Create last two numbers in the sequence (rather than whole array)
  i. last_two = [1, 1]
  b.Next number is sum of last two numbers
    i. next_num = last_two[0] + last_two[1]
    ii.last_two[0] = last_two[1]  # shift numbers left
    iii. last_two[1] = next_num
  c. Increment index counter
    i.index_counter += 1
3.CHECK the number of digits in the next number
  a.Convert to string
    i.last_two[1].to_s
  b.Measure length of string
    i. last_two[1].to_s.length
4.IF the number of digits is the same as the argument passed to the method, then return index counter as the 
  a.If statement
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Strategy A using simple loops

# def find_fibonacci_index_by_length(target)
#   index_counter = 2
#   last_two = [1, 1]
#   next_num = 0
#   loop do
#     next_num = last_two[0] + last_two[1]
#     # binding.pry
#     last_two[0] = last_two[1]  # shift numbers left
#     last_two[1] = next_num
#     index_counter += 1
#     break if last_two[1].to_s.length == target
#   end
#   index_counter
# end


# -------------------

# solution 2 - Strategy B using an UNTIL loop

# def find_fibonacci_index_by_length(target)
#   index_counter = 2
#   last_two = [1, 1]
#   next_num = 0
  
#   until last_two[1].to_s.length == target
#     next_num = last_two[0] + last_two[1]
#     # binding.pry
#     last_two[0] = last_two[1]  # shift numbers left
#     last_two[1] = next_num
#     index_counter += 1
#   end
  
#   index_counter
# end

# -------------------

# solution 3 - Strategy A using separate variables instead of an array

def find_fibonacci_index_by_length(target)
  index_counter = 2
  last = 1
  penultimate = 1
  next_num = 0
  
  until last.to_s.length == target
    next_num = penultimate + last
    # binding.pry
    penultimate = last
    last = next_num
    index_counter += 1
  end
  
  index_counter
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p find_fibonacci_index_by_length(2) # 7 

# Test Cases
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847