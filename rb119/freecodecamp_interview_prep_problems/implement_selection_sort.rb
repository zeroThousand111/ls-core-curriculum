=begin
Implement Selection Sort
The Problem
Here we will implement selection sort. Selection sort works by selecting the minimum value in a list and swapping it with the first value in the list. It then starts at the second position, selects the smallest value in the remaining list, and swaps it with the second element. It continues iterating through the list and swapping elements until it reaches the end of the list. Now the list is sorted. Selection sort has quadratic time complexity in all cases.

Instructions: Write a function selectionSort which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

# UNDERSTAND THE PROBLEM
## INPUT: an array of integers
## OUTPUT: an array of integers, sorted in ascending numerical order
## RULES:
### Explicit requirements:
  - selection_sort should be a method.
  - selection_sort should return a sorted array (least to greatest).
  - selection_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])` should   return an array that is unchanged except for order.
  - selection_sort should not use the built-in `.sort()` method.
### Implicit requirements:
  - need to write my own test cases
  - I will assume that the method MUTATES the calling object array
  - I will assume some arrays may contain duplicate values
  - I will assume empty arrays may be possible

# TEST CASES
# Explicit requirements:
- selection_sort should be a method.
- selection_sort should return a sorted array (least to greatest).
- selection_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])` should return an array that is unchanged except for order.
- selection_sort should not use the built-in `.sort()` method.

N.B. Write my own simple test cases

# DATA STRUCTURES
An array of integers

# ALGORITHM

* MOVE through the input array of integers
  + start at element at index 0
  + stop after penultimate element (not last element, because the array should be sorted at that point)
  + could use an iterator like Integer#upto
    - 0.upto(array.size - 2)
* CREATE a subarray of diminishing length from which to examine values
  + start_index will increase by 1 in iterator above
    - array[start_index..-1], diminishing by 1 on every iteration
* DETERMINE the INDEX of the element in the subarray with the smallest value
  + DETERMINE the smallest value
  + could use using Array#min
  + DETERMINE the index of that value 
    + because we are examining a diminishing subarray, but we want the index of the whole array, we will add the start index to the index of the element with the smallest value in the current subarray
    - min_index = selection_subarray.each_with_index.min.last + start_index
* SWAP the element with the smallest value with the first element of the input array i.e. index 0
  + use multiple parallel assignment e.g. x, y = y, x
  
* MOVE to the element at index 1, and SWAP the element with the smallest value at index above 0 with element at index 1
* REPEAT until the penultimate element (at index -2) has been swapped
* RETURN sorted input array
=end

require 'pry'
require 'pry-byebug'

def selection_sort(array)
  0.upto(array.size - 2) do |start_index|
    array[start_index..-1]
    min_index = array[start_index..-1].each_with_index.min.last + start_index
    array[start_index], array[min_index] = array[min_index], array[start_index]
  end
  array
end

p selection_sort([3, 1, 2]) == [1, 2, 3]
p selection_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
p selection_sort([2, 1, 1]) == [1, 1, 2]
p selection_sort([10, 3, 7, 99, 2000]) == [3, 7, 10, 99, 2000]
p selection_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])