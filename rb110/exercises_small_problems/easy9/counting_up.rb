=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

INPUT: An Integer

OUTPUT: An Array

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Returns an Array;
  - Array contains all integers from 1 up to the argument;
  - Argument will always be an Integer above 0.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an empty list; []
2. Create a counter and give it a value of 1
3. Add number 1 to the list;
4. Add 1 to the value of counter
5. Repeat steps 3-4 UNTIL counter is the same as the argument 

______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use a simple loop

# def sequence(final_num)
#   list = []
  
#   counter = 1
#   loop do 
#     list << counter
#     counter = counter + 1 # counter += 1
#     break if counter > final_num
#   end
  
#   list
# end

# solution 2 - using #upto

def sequence(final_num)
  list = []
  1.upto(final_num) { |num| list << num }
  list
end

# Print Tests
p sequence(5) # [1, 2, 3, 4, 5]

# Test Cases
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]