=begin
# Understand the problem
Reframe the problem: Split an array into pairs of subarrays to the left and right of an element in that array.  If the sum of the elements in the subarrays are the same, return the index number of the central element.  If no pair of subarrays are equal, return -1 instead.

inputs: an array of integers
outputs: an integer, representing the index number of the central element where the subarrays either side have the same sum
Rules:
  Explicit requirements:
  - return an integer of the central element, else return -1
  - Empty arrays are equal to zero in this problem
  Implicit requirements:
  - Negative integers are allowed
  - Integers of any place value are allowed
  - Arrays of any number of elements are allowed, including both odd and even numbers of elements

# Examples and Test Cases

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, -80]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# Data Structures
Arrays

# Algorithm
* MOVE through the array, taking each element in turn
  + increment the index number each time
  + use a simple loop and local variable index?
  + use #upto, or #each iterators?
* For each index number, CREATE a left subarray and a right subarray
  + use Array#slice method with a range argument
  + left array range is 0..(index - 1) or 0...index
  + right array range is (index + 1)..-1
* SUM the values of the left and right subarrays
* COMPARE the values, and if the sums of left and right subarrays are the same, then return the index number
* FINISH moving through the array
* RETURN -1 if no balanced pair of subarrays has already returned a value
=end

def find_even_index(array)
  0.upto(array.size - 1) do |index|
    left_array = array[0...index]
    right_array = array[(index + 1)..-1]
    left_sum = left_array.sum
    right_sum = right_array.sum
    return index if left_sum == right_sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3