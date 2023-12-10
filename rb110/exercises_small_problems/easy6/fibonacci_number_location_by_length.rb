=begin
________________________________________________________________________________
*****Problem*****
________________________________________________________________________________
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.

Input:
  # What is the form of the data you want to transform?
  
  An Integer, representing the target number of digits
  
Output:
  # What is the form of the data you want the program to either return or print?
  
  An Integer, representing the index number in the Fibonacci sequence of the lowest number with the input number of digits
  
Explicit reqs:
  # What does the problem say about what you should do?
  
  - You may assume that the argument is always greater than or equal to 2.
  - Write a method.
  
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  
  - Does the answer need to be calculated or brute force counting?
  - Are we expected to account for performance issues if we brute force count?
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  
  find_fibonacci_index_by_length(2) == 7      # 1 1 2 3 5 8 13
  find_fibonacci_index_by_length(3) == 12     # 1 1 2 3 5 8 13 21 34 55 89 144
  find_fibonacci_index_by_length(10) == 45
  find_fibonacci_index_by_length(100) == 476
  find_fibonacci_index_by_length(1000) == 4782
  find_fibonacci_index_by_length(10000) == 47847
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  Input: Integer
  Output: Integer
  Interim: Array
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  1. Create sequence_array starting with [1, 1, 2, 3, 5, 8, 13];
  2. Generate next number in the Fibonacci sequence, starting with 8 + 13;
  3. Store next sequential number in an sequence_array;
  4. When size of integer is target_digits, then stop generating;
  5. Count elements of sequence_array.
  
  
________________________________________________________________________________
Time to code!
=end


# solution 1 and only - apologies to the SystemStack for the larger arguments!
def find_fibonacci_index_by_length(target_digits)
  sequence_array = [1, 1, 2, 3, 5, 8, 13]
  
  until sequence_array[-1].to_s.length == target_digits
    next_integer = sequence_array[-2] + sequence_array[-1]
    sequence_array << next_integer
  end
  sequence_array.size
end

# print results
p find_fibonacci_index_by_length(2) # 7
p find_fibonacci_index_by_length(3) # 12

# test cases
p find_fibonacci_index_by_length(2) == 7      # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12     # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847