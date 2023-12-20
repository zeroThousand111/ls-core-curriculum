=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

INPUT: An array of integers

OUTPUT: A String with an integer result inside it

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Output is product of all array, divided by number of elements;
  - Output is rounded to 3 decimal places
  - Assume the array is non-empty
  
IMPLICIT REQUIREMENTS:
  - Each element can be a double figure number;
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

Arrays.  Integers.
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Multiply product of all elements in the array
  a. Create a local variable product with a value of 1
  b. Iterate through the array and *= each element
2. Divide by number of elements in the array
3. Round to 3 d.p.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop

# def show_multiplicative_average(array)
#   product = 1.0
#   counter = 0
  
#   loop do
#     product *= array[counter]
#     counter += 1
#     break if counter == array.size
#   end
  
#   result = product / array.size
#   "The result is #{sprintf('%.3f', result)}"
# end

# solution 2 - using Enumerable#inject

def show_multiplicative_average(array)
  result = array.inject(:*) / array.size.to_f
  "The result is #{sprintf('%.3f', result)}"
end

# solution 3 - official LS solution

# def show_multiplicative_average(numbers)
#   product = 1.to_f
#   numbers.each { |number| product *= number }
#   average = product / numbers.size
#   puts "The result is #{format('%.3f', average)}"
# end


# Test Cases
p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667