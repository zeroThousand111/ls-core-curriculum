=begin
Write a function that returns the maximum possible consecutive
alternating odd and even (or even and odd) numbers. Minimum possible
length is 2. If there's none return []

# PROBLEM
## INPUT: an array of integers
## OUTPUT: an array of integers, which is a subarray of the input array
## RULES
### Explicit requirements:
  - a method;
  - return a subarray containing consecutive even and odd integers
### Implicit requirements:
  - "consecutive" means an unbroken chain
  - returns, means return an array of even/odd numbers
  - in other words, two adjacent even, or two adjacent odd integers will cause the chain to break

# EXAMPLES

p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
p longest_alternating_subarray([2, 4, 6, 8]) == [] ALL EVEN
p longest_alternating_subarray([1, 3, 5, 7]) == [] ALL ODD
p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5] ODD, EVEN, ODD
p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]

# DATA STRUCTURES
An array of integers, and subarrays of those integer sequences

# ALGORITHM
## HIGH LEVEL
1. CREATE an array of all possible subarrays, minimum length two integers
2. SELECT those subarrays that are ONLY even/odd consecutive integers
2.b. CREATE custom helper method to DETERMINE if subarray contains only odd/even numbers
3. RETURN the selected subarray that is the largest size or an empty array

1. CREATE ALL SUBARRAYS
* Use a helper method
* CREATE an empty array of subarrays
* MOVE through the array of integers from first number to penultimate
  + use two nested #upto iterators
  + the stop_index will always be at least start_index + 1 i.e. array slice will be at least two integers
* SHOVEL each slice to the array of subarrays

2. SELECT only those subarrays with consecutive odd/even numbers
* Use #select
* refer to a custom helper method in the block to evaluate truthiness

2.b. CREATE custom helper method to DETERMINE if subarray contains only odd/even numbers
* CREATE a helper method
* SET local variable to either odd or even
  + determine if first number is odd or even and assign string value to variable
    - subarray[0].odd?
  + IF first number is odd, set previous_num = "odd"
  + ELSE set previous_num = "even"
  
* MOVE through the rest of the subarray from index 1 to -1
  + use an #upto loop for indices from 1 to -1
* DETERMINE if current num is odd or even and COMPARE with previous num
  + IF current num is odd and previous is even OR current num is even and previous num is odd, move on 
  + ELSE return false 

3. RETURN the selected subarray that is the largest size or an empty array
* RETURN an empty array if the selected array is empty
* Select subarray from selected array with the largest number of elements
  + use #max_by and a block
    - 
=end

def is_odd_even?(subarray)
  if subarray[0].odd?
    previous_num = "odd"
  else 
    previous_num = "even"
  end
  
  1.upto(subarray.size - 1) do |index|
    if subarray[index].odd?
      current_num = "odd"
    else 
      current_num = "even"
    end
    return false if current_num == previous_num
    previous_num = current_num
  end
  true
end

# p is_odd_even?([1, 2, 3]) == true
# p is_odd_even?([2, 2]) == false

def create_subarrays(array)
  array_of_subarrays = []
  0.upto(array.size - 2) do |start_index|
    (start_index + 1).upto(array.size - 1) do |stop_index|
      array_of_subarrays << array[start_index..stop_index]
    end
  end
  array_of_subarrays
end

def longest_alternating_subarray(array)
  array_of_subarrays = create_subarrays(array)
  filtered_array = array_of_subarrays.select { |subarray| is_odd_even?(subarray) }
  return [] if filtered_array.empty?
  filtered_array.max_by { |subarray| subarray.size }
end

p longest_alternating_subarray([1, 2, 3, 4, 5, 6]) == [1, 2, 3, 4, 5, 6]
p longest_alternating_subarray([2, 4, 6, 8]) == []
p longest_alternating_subarray([1, 3, 5, 7]) == []
p longest_alternating_subarray([1, 1, 3, 7, 8, 5]) == [7, 8, 5]
p longest_alternating_subarray([4, 6, 7, 12, 11, 9, 17]) == [6, 7, 12, 11]
