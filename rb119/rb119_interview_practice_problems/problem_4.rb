=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

# UNDERSTAND THE PROBLEM

## INPUT: an array of Integers
## OUTPUT an array of two Integers, that are the Integers in the input array with the least difference in value between them
## RULES
### Explicit requirements
 - a method;
 - return are the two Integers that are the closest in value, as an array of Integers;
 - if there are multiple pairs that are equally close, return the first pair

### Implicit requirements
  - Integers in test cases are all positive and non-zero
  - different sizes of input array to be expected
  - integers in test cases are unique to that array, no repeats

Examples

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11] # 4 difference
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27] # 2 difference
p closest_numbers([12, 22, 7, 17]) == [12, 7]
The above tests should each print true.

# DATA STRUCTURES

- An array of subarrays
- OR a hash, with keys of arrays and values of difference e.g. {[25, 27] => 4}

# ALGORITHM

* CREATE an empty array of subarrays
* MOVE through the input array and CREATE subarrays of pairs of Integers and SHOVEL them into the array_of_subarrays
  + use two nested #upto iterators
  + start index is 0 stop index up to last element
* 
* SORT subarray pairs by difference in ascending order of difference
  + use #sort_by with block
  + square the difference to prevent the effect of negative differences
  
* RETURN the first pair in the sorted array of subarrays
  + use #first
=end

def closest_numbers(input_array)
  array_of_subarrays = []
  0.upto(input_array.size - 1) do |index1|
    (index1 + 1).upto(input_array.size - 1) do |index2|
      array_of_subarrays << [input_array[index1], input_array[index2]]
    end
  end
  
  array_of_subarrays.sort_by { |(num1, num2)| (num1 - num2)**2 }.first
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11] # 4 difference
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27] # 2 difference
p closest_numbers([12, 22, 7, 17]) == [12, 7] # 5 difference