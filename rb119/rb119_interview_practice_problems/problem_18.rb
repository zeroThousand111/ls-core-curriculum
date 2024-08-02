=begin
Problem 18
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

# PROBLEM
## INPUT: an array of integers
## OUTPUT: an integer, an index
## RULES
### EXPLICIT REQUIREMENTS
  - return the index at which all the integers to the left sum to the same value to all the integers to the right
  - else return -1
  - at index 0, the sum of left is 0
  - at index -1, the sum of right is 0
  - if there are multiple answers, return the lowest index
  - 
### IMPLICIT REQUIREMENTS
  - positive and negative integers can be included in the array
  - no test case for -1

Examples

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
The above tests should each print true.

# DATA STRUCTURES
Input: an array of integers
Ouput: a single integer
Intermediate: possibly two subarrays, left and right

# ALGORITHM
## HIGH-LEVEL
1a. Move through the input array from the first index position to the last, creating a new left and right subarray at each index
1b.Account for left being 0 when index is 0, and right being 0 when index is -1
2. COMPARE the sum of subarrays left and right
3. RETURN the index IF left.sum == right.sum, else return -1

## DETAILS
1a. Move through the input array from the first index position to the last, creating a new left and right subarray at each index
* MOVE through the input array from first index to the last
  + use #each_index or #upto
* CREATE new subarray for left and right at each index position
  + aside from indices 0 and -1, left is array[0...index], right is array[index + 1..-1]
1b.Account for left being 0 when index is 0, and right being 0 when index is -1
* When index is 0, left is 0. When index is -1, right is 0
2. COMPARE the sum of subarrays left and right
* COMPARE using #sum on left and right
    - left.sum == right.sum
3. RETURN the index IF left.sum == right.sum, else return -1
* CREATE if statement structure

=end

def equal_sum_index(array)
  array.each_index do |index|
    if index == 0
      left = 0
      right = array[(index + 1)..-1].sum
    elsif index == -1
      left = array[0...-1].sum
      right = 0
    else
      left = array[0...index].sum
      right = array[(index + 1)..-1].sum
    end
    
    return index if left == right
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

# my own test case to check no balance point
p equal_sum_index([1, 2, 3, 4]) == -1

