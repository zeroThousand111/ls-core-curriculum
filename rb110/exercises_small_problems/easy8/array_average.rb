=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

INPUT: An array of integers

OUTPUT: An integer

RULES
EXPLICIT REQUIREMENTS:
  - Return is the average of all numbers in the array and should be an integer;
  - Array will never be empty;
  - Numbers will always be positive integers
  - Array#sum is not allowed.
  
  
IMPLICIT REQUIREMENTS:
  -
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

1.Create a sum local variable;
2.Iterate through each number of the input_array;
3.Add (abbreviated assignment +=) each integer to the `sum`;
4.When all elements of the input_array have been added, finish iterating
5.Divide the `sum` by the number of elements in the input_array and return this result.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop

# def average(input_array)
#   sum = 0
  
#   counter = 0
#   loop do
#     sum += input_array[counter]
#     counter += 1
#     break if counter == input_array.size
#   end
  
#   sum / input_array.size
# end

# solution 2 - using #each

# def average(input_array)
#   sum = 0
  
#   input_array.each do |num|
#     sum += num
#   end
  
#   sum / input_array.size
# end

# solution 3 - using #inject

# def average(input_array)
#   input_array.inject(:+) / input_array.size
# end

# solution 4 - returning a float

def average(input_array)
  p (input_array.inject(:+) / input_array.size).to_f
end

# Print Tests


# Test Cases
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40