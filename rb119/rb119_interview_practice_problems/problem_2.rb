=begin
Problem 2
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.




# UNDERSTAND THE PROBLEM
## INPUT: an array of Integers
## OUTPUT: an Integer, or nil
## RULES
### Explicit requirements:
  - a method that takes an array of integers as an argument;
  - return the "minimum sum" of "5 consecutive numbers" in the array
  - if the array contains fewer than 5 elements, return nil
### Implicit requirements:
  - negative Integers are allowed in the input array
  - zero is allowed in the input array

# EXAMPLES / TEST CASES

Examples

p minimum_sum([1, 2, 3, 4]) == nil  # fewer than 5 elements
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9 # sum of 2, 3, 4, 5, -5
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15 # sum of 1, 2, 3, 4, 5
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16 # sum of 2, 6, 5, 1, 2
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
The above tests should each print true.

# DATA STRUCTURES
arrays of integers

# ALGORITHM

* CREATE a min_sum local variable
* if input_array < five elements, RETURN nil
* CREATE an array of subarrays (each with 5 elements)
* MOVE through the input_array and SHOVEL each consecutive 5-element array to the array_of_subarrays
  + use #upto iterator from 0 to input_array.size - 5
  + start_index is from first element index 0 to input_array.size - 5
  + slice is always 5 elements for each subarray
* MOVE through the array of subarrays and CALCULATE the SUM of each subarray
  + use #map to return the sum of each subarray
    - array_of_subarrays.map { |sub| sub.sum }
  + use #min to return the smallest value of the sums
    - array_of_subarrays.map { |sub| sub.sum }.min
* RETURN the smallest sum
=end

def minimum_sum(input_array)
  return nil if input_array.size < 5
  
  array_of_subarrays = []
  0.upto(input_array.size - 5) do |start_index|
    array_of_subarrays << input_array[start_index, 5]
  end
  array_of_subarrays.map { |sub| sub.sum }.min
end


# test cases

p minimum_sum([1, 2, 3, 4]) == nil  # fewer than 5 elements
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9 # sum of 2, 3, 4, 5, -5
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15 # sum of 1, 2, 3, 4, 5
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16 # sum of 2, 6, 5, 1, 2
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10