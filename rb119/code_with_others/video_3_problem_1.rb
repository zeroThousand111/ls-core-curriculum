=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers.

maxSequence = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6 [4, -1, 2, 1]

Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array.  If the array is made up of only negative numbers, return 0 instead.

Empty array is considered to have 0 greatest sum.  Note that the empty array is also a valid subarray.

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# Redefine the problem:

Input: an array
Output: an integer
Rules:
Explicit requirements:
  - return the sum of the subarray that has the largest sum of all possible continguous (i.e. keeping the same index order) subarrays
  - return 0 if the input array is empty
  - return 0 if all the elements of the input array are negative integers

Implicit requirements:
  - the elements of the input array are only integers, not any other object

Questions:
  - an empty array is also a valid subarray?  I am not clear what this statement means

# Examples
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# Data Structure:
Arrays

# Algorithm

* CREATE an array of all possible subarrays
  + use nested #upto methods and blocks to generate start and finish indexes
  + subarrays include those with just one integer
  + shovel each subarray into the array of subarrays
* MOVE through the array of sub arrays
* CREATE a tally ARRAY collecting the sums of the subarrays
  + could use #each_with_object passed an empty array as an argument
    - { tally_array << subarray.sum }
* RETURN the highest value in the tally array
    - tally_array.max
=end


def create_array_of_subarrays(input_array)
  output_array = []
  0.upto(input_array.size - 1) do |start_index|
    finish_index = start_index
    finish_index.upto(input_array.size - 1) do |finish_index|
      output_array << input_array[start_index..finish_index]
    end
  end
  output_array
end

def max_sequence(input_array)
  array_of_subarrays = create_array_of_subarrays(input_array)
  tally_array = array_of_subarrays.each_with_object([]) do |subarray, array|
    array << subarray.sum
  end
  return 0 if input_array.empty? || input_array.all? { |num| num < 0}
  tally_array.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12