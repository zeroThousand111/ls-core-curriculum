=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Rewrite your recursive fibonacci method so that it computes its results without recursion.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - No recursion allowed!
  -
  -
  
IMPLICIT REQUIREMENTS:
  - It won't trip up on a StackSizeError
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create the start of the fibonacci sequence in an array i.e. [1, 1]
2. Generate the next sequence in the sequence from adding array[-2] + array[-1]
3. Add this to the end of the array (push or shovel operator)
4. Repeat steps 2-3 (nth - 2) times (to account for the two figures already there)
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop to generate an array of fibonacci numbers

# def fibonacci(n)
#   counter = 0
#   array = [1, 1]
#   loop do
#     array.push(array[-2] + array[-1])
#     counter += 1
#     break if counter == n - 2 
#   end
#   array.last
# end

# -------------------

# solution 2 - variation of solution 1 using Integer#times

def fibonacci(n)
  array = [1, 1]
  (n - 2).times do
    array << (array[-2] + array[-1])
  end
  array[-1]
end

# -------------------

# Print Tests
# p fibonacci(12) # 144
# p fibonacci(20) # 6765
# p fibonacci(100) # 354224848179261915075
p fibonacci(1)
p fibonacci(2)

# Test Cases
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501