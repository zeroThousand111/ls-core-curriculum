=begin
You are going to be given an array of integers.  Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of integers to the right of N.  If there is no index that would make that happen, return -1.

For example:

Lets say you are given the array [1, 2, 3, 4, 3, 2, 1]:
Your method will return the index 3, because at the third position of the array, the sum of the left side of the [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

# Another one:

You are given the array [20, 10, -80, 10, 10, 15, 35].  At index 0, the left side is [] and the right is [10, -80, 10, 10, 15, 35].  They are both equal to zero when added together.  (Empty arrays are equal to zero in this problem).  Index 0 is the place where the left and the right sides are equal.

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, -80]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of integers to the right of N.

# UNDERSTAND
## INPUT: an array of integers, 
## OUTPUT: an Integer, the index at which the numbers to the left equal the numbers to the right, or -1
## RULES
### EXPLICIT REQUIREMENTS
  - return the index of the input at which the numbers to the left sum to the same value as the numbers to the right
  - Or return -1 if there is no such "balance point"
### IMPLICIT REQUIREMENTS
  - the input integers can be positive or negative
  - the input array can contain even or odd numbers of elements
  - the input array can be different sizes of elements
  - at index 0, left is value of 0
  - at index -1, right is value of 0

# DATA STRUCTURES
input: an array of integers
output: an Integer
intermediate:
  - track subarrays left and right of current index

# ALGORITHM
## HIGH-LEVEL APPROACH 1
1. Create local variables left and right
2a. Move through the input array, tracking index, creating subarrays left and right of current index
2b. When index is 0, left is 0.  When index is -1, right is 0.
3. COMPARE left sum with right sum
4. RETURN index if left sum == right sum
5. ELSE RETURN -1

## DETAIL
1. Create local variables left and right
2a. Move through the input array, tracking index, creating subarrays left and right of current index
  + use each_index

2b. When index is 0, left is 0.  When index is -1, right is 0.
3. COMPARE left sum with right sum
    - left.sum == right.sum
4. RETURN index if left sum == right sum
5. ELSE RETURN -1

=end

def find_even_index(input)
  input.each_index do |index|
    left_sum = input[0...index].sum
    right_sum = input[(index + 1)..-1].sum
    return index if left_sum == right_sum
  end
  -1
end


p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, -80]) == -1 # really?  index 3 doesn't exist
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3