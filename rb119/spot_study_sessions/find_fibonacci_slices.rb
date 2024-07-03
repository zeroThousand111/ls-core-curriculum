=begin
Implement function that finds all fibonacci slices in a given array of integers. A Fibonacci slice is a sequence where every number after the first two is the sum of the two preceding ones. The minimum length is 3.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers
## OUTPUT: an array of those "subarrays", formed of contiguous subarrays from the input array, that follow the fibonacci sequence
## RULES
### Explicit requirements:
  - a method;
  - find all the "fibonacci slices" in an array of integers
  - the minimum size of subarray to return will be 3 Integers
### Implicit requirements:
  - all test cases have only positive integers in input array
  - "fibonacci" means follows the Fibonacci sequence
  - "Fibonacci sequence" means that the current number of the sequence is the sum of the previous two numbers
  - "slices" means subarrays in the array of integers
  - 
  
# EXAMPLES
Test cases
puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]] i.e. all subarrays of size 3 and over, because the input array completely follows the Fibonacci sequence
puts find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]) == []

# DATA STRUCTURES
Arrays of integers
Array of subarrays of integers

# ALGORITHM

## High-level steps
1. CREATE an array containing all possible contiguous subarrays of 3 elements or more
2. SELECT those subarrays that follow the Fibonacci sequence
2.b. DETERMINE if the subarray follows the sequence and use result to select
3. RETURN the above selection

1. CREATE AN ARRAY OF ALL POSSIBLE SUBARRAYS
* Use a helper method
* CREATE an empty array
    - array_of_subarrays
* CREATE two nested loops for incrementing start and stop indexes
  + Use two nested #upto loops
  + start inner loop at start_index + 2, to ensure min of 3 elements in each subarray

2. SELECT ONLY SUBARRAYS that follow the sequence
* FILTER the array of subarrays using select
  + Use #select method
  + invoke a helper method in the block that returns a boolean value (that will be returned to #select)
* EXAMINE current subarray and DETERMINE if ALL the numbers follow the fibonacci sequence
  + use a helper method that returns a boolean
  * MOVE through the integers in the subarray
    + use #each_with_index
  * EXAMINE current integer and it's index
  * ACT upon determination above
    + if number has index > 1 (i.e. third or higher index in subarray)
    + RETURN false UNLESS num == subarray[index - 1] + subarray[index - 2]
  * RETURN true if the iterator has not yet returned false

3. RETURN selection
  + no need to modify select method
=end
def create_subarrays(array)
    array_of_subarrays = []
    0.upto(array.size - 1) do |start_index|
        (start_index + 2).upto(array.size - 1) do |stop_index|
            array_of_subarrays << array[start_index..stop_index]
        end
    end
    array_of_subarrays
end

def is_fibonacci?(subarray)
    subarray.each_with_index do |num, index|
      if index > 1
        return false unless num == subarray[index - 1] + subarray[index - 2]
      end
    end
    true
end

# p is_fibonacci?([1, 1, 2]) == true
# p is_fibonacci?([9, 1, 2]) == false
# p is_fibonacci?([1, 2, 3, 5, 8]) == true

def find_fibonacci_slices(array)
    array_of_subarrays = create_subarrays(array)
    array_of_subarrays.select { |sub| is_fibonacci?(sub) }
end

# Test cases
p find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []