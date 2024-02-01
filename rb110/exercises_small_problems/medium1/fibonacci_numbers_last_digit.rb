=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

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

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4

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

def fibonacci_last(n)
  array = [1, 1]
  (n - 2).times do
    array << (array[-2] + array[-1])
  end
  num = array[-1]
  numerical_string = num.to_s
  numerical_string[-1].to_i
end

# -------------------

# solution 2 - variation of solution 1 using Integer#times



# -------------------

# Print Tests

# Test Cases
p fibonacci_last(1) == 1
p fibonacci_last(2) == 1
p fibonacci_last(3) == 2
p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# p fibonacci_last(123456789) # -> 4