=begin
# The Problem
You have to create a method that takes a positive integer and returns the next biggest number formed by the same digits.

12 ==> 21
513 ==> 531
2017 ==> 2071

If no bigger number can be formed from the digits, then return `-1`:

9 ==> -1
111 ==> -1
531 ==> -1

Examples
next_bigger_num(9) == -1
next_bigger_num(12) == 21
next_bigger_num(513) == 531
next_bigger_num(2017) == 2071
next_bigger_num(111) == -1
next_bigger_num(531) == -1
next_bigger_num(123456789) == 123456798


# Input: An integer
# Output: A new integer, the next highest number using the same digits, or -1 if there is no higher number

# Rules:

## Explicit requirements:
  - A method
  - input integer is always positive (so not 0 or below)

## Implicit requirements:
  - input is always an integer, not any other kind of object

# Examples/Test cases
next_bigger_num(9) == -1
next_bigger_num(12) == 21
next_bigger_num(513) == 531
next_bigger_num(2017) == 2071
next_bigger_num(111) == -1
next_bigger_num(531) == -1
next_bigger_num(123456789) == 123456798

# Data Structures:
  - Arrays will be helpful

# Algorithm:
* CREATE an array of digits from the input integer
* CREATE an array of subarrays of all possible combinations of those digits
  + Use Integer#digits (don't need to reverse resulting array of integers)
* CREATE an array of integers from all possible combinations of digits
  + an array of 2 digits should produce 2 subarrays `[x, y]` and `[y, x]
  + an array of 3 digits will produce 6 subarrays `[x, y, z]`, `[x, z, y]`, [y, x, z]`, `[y, z, x]`, `[z, x, y]`, `[z, y, x]`
  + Join the subarrays of digits then transform them to integers
    - subarray.join.to_i
  + use Array#permutation(array.size)
    - array_of_digits(array_of_digits.size) { |permutation| array_of_integers << permutation.join }
  + mutated the array by popping off the last digit and prepending it to front
    - array_of_digits.unshift(array_of_digits.pop)
  + use Array#join on subarray to create a new integer
 
* SORT the array of integers in numerical order
  + Use Array#sort
* EXAMINE array of integers
* ACT on result of examination
  + IF there is only one integer in the array, RETURN -1
  + IF all the digits are the same, RETURN -1
* COMPARE each integer in turn 
  + use #each to move through array of integers
* ACT on comparison
  + RETURN the FIRST integer in the array that has a higher value than the input integer
    - return candidate_integer if candidate_integer > input_integer
  + IF there is no larger integer in the array, RETURN -1
    - return -1 if array_of_integers[-1] < input_integer
=end

def next_bigger_num(input_integer)
  array_of_digits = input_integer.digits
  array_of_integers = []
  
  array_of_digits.permutation(array_of_digits.size) { |permutation| array_of_integers << permutation.join.to_i }

  array_of_integers.sort!

  return -1 if array_of_integers.size == 1
  return -1 if array_of_digits.all? { |n| n == array_of_digits[0] }

  array_of_integers.each do |candidate_integer|
    return candidate_integer if candidate_integer > input_integer
    return -1 if candidate_integer == array_of_integers[-1]  
  end
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798