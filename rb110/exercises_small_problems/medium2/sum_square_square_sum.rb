=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Input integers will always be positive i.e. > 0
  -
  
IMPLICIT REQUIREMENTS:
  - Example of input 3 - (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2) # => 22
  - sum_square is (1..n)**2
  - square_sum is (1**2 + 2**2 + .. etc)
  - The difference i.e. the final return is sum_square - square_sum

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays needed to generate a list of positive numbers up to the input Integer

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. CREATE an array of Integers from 1..input number
  a. Array is from 1 through to the input number (n)
    i.  (1..n).to_a
2. CALCULATE the square of summed numbers
  a. Sum all of the numbers in the Array
    i. array.reduce(:+); OR
    ii. array.sum; OR
    iii. Use a loop or #each to iterate through the array and increment sum
  b. Square the sum
    i. square_of_sums = sum**2
3. CALCULATE the squares and sum them
  a. Square all of the numbers in the array by creating a new array of these values
    i. square_array = array.map { |i| i**2 }
  b. Sum all of the numbers in the squared numbers array
    i. sum_of_squares = squared_array.reduce(:+); OR
    ii. squared_array.sum; OR
    iii. Use a loop or #each to iterate through the array and increment sum
4. CALCULATE the difference between the square of summed numbers and the sum of squared numbers
  a. Take away the sum of squares from the square of sums
    i. value = square_of_sums - sum_of_squares
5. RETURN value
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Using #inject

# def sum_square_difference(num)
#   array = (1..num).to_a
#   sum_of_squares = array.inject(:+)**2
#   squares_array = array.map { |i| i**2 }
#   square_of_sums = squares_array.inject(:+)
#   sum_of_squares - square_of_sums
# end

# -------------------

# solution 2 - Solution 1 refactored to look more clever

# def sum_square_difference(num)
#   array = (1..num).to_a
#   sum_of_squares = array.inject(:+)**2
#   square_of_sums = array.map { |i| i**2 }.inject(:+)
#   sum_of_squares - square_of_sums
# end

# -------------------

# solution 3 - Solution 1 refactored even more to look even more clever

# def sum_square_difference(num)
#   array = (1..num).to_a
#   (array.inject(:+)**2) - (array.map { |i| i**2 }.inject(:+))
# end

# -------------------

# solution 4 - Using #sum instead of #inject

def sum_square_difference(num)
  array = (1..num).to_a
  (array.sum**2) - (array.map { |i| i**2 }.sum)
end

# -------------------

# Print Tests

# Test Cases
p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150