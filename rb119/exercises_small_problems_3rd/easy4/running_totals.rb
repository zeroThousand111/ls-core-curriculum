=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

# Understand the Problem

## Reframe the problem

Return a new array containing the same value of the first element of the calling object, but all subsequent elements should be the element at that index plus the value of the preceding element

## inputs: an array of positive integers
## outputs: an array of different positive integers
## Rules
### Explicit requirements:
  - returns an array where the first element is the same as the input array, but subsequent elements are running totals of the integer at that index in the calling object plus the previous element
### Implicit requirements
  - the returned array will be NEW
  - the input array can be empty
  - the input array can contain just one element
  
---

Further Exploration
Try solving this problem using Enumerable#each_with_object or Enumerable#reduce (note that Enumerable methods can be applied to Arrays).

=end

def running_total(input_array)
  running_total = 0
  input_array.map do |num|
    running_total += num
  end
end

# Further exploration - using Enumerable#each_with_object

def running_total(input_array)
  running_total = 0
  input_array.each_with_object([]) do |num, array|
    running_total += num
    array << running_total
  end
end

# Further exploration - using Enumerable#reduce

def running_total(input_array)
  output_array = []
  input_array.each_index do |index|
    subarray = input_array[0..index]
    output_array << subarray.reduce(:+)
  end
  output_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
