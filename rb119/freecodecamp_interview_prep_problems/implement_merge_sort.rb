=begin
Implement Merge Sort
The Problem
Another common intermediate sorting algorithm is merge sort. Like quick sort, merge sort also uses a divide-and-conquer, recursive methodology to sort an array. It takes advantage of the fact that it is relatively easy to sort two arrays as long as each is sorted in the first place. But we'll start with only one array as input, so how do we get to two sorted arrays from that? Well, we can recursively divide the original input in two until we reach the base case of an array with one item. A single-item array is naturally sorted, so then we can start combining. This combination will unwind the recursive calls that split the original array, eventually producing a final sorted array of all the elements. The steps of merge sort, then, are:

1) Recursively split the input array in half until a sub-array with only one element is produced.

2) Merge each sorted sub-array together to produce the final sorted array.

Merge sort is an efficient sorting method, with time complexity of O(nlog(n)). This algorithm is popular because it is performant and relatively easy to implement.

As an aside, this will be the last sorting algorithm we cover here. However, later in the section on tree data structures we will describe heap sort, another efficient sorting method that requires a binary heap in its implementation.

Instructions: Write a function mergeSort which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest. A good way to implement this is to write one function, for instance merge, which is responsible for merging two sorted arrays, and another function, for instance mergeSort, which is responsible for the recursion that produces single-item arrays to feed into merge. Good luck!

# UNDERSTAND THE PROBLEM

## INPUT: an array of Integers, unsorted
## OUTPUT: an array of the same Integers, but sorted
## RULES:
### Explicit requirements:
  - merge_sort should be a method
  - merge_sort should return a sorted array (least to greatest)
  - merge_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])` should return   an array that is unchanged except for order 
  - merge_sort should not use the built-in `.sort()` method
  - there are two parts to this problem: a method that merges two arrays of Integers into a sorted array, and then a control method that uses recursion to split and merge the input array until it reaches an array of "atomic" subarrays of just one element each

### Implicit requirements:
  - the control method will need a helper method to merge two arrays of unsorted Integers

# EXAMPLES / TEST CASES
Test Cases
### Explicit requirements:
- merge_sort should be a method
- merge_sort should return a sorted array (least to greatest)
- merge_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])` should return an array that is unchanged except for order 
- merge_sort should not use the built-in `.sort()` method

N.B. Use the test cases from the two Advanced1 problems "merge"

# DATA STRUCTURES
Arrays of Integers

# ALGORITHMS

## PART 1 - MERGE SORTED LISTS
* NAME the method parameters appropriately
  + this will help visualise the problem
    - def merge(left, right)
* CREATE an empty merged array
* TRACK the indexes of both arrays
  + use an iterator on left array
    - left.each do |left_index|
  + CREATE a local variable to track the right index
    - left_index = 0
    - right_index = 0
* MOVE through BOTH left and right arrays at different speeds
  + use a loop with a conditional break condition where both left_index and right_index are at their respective -1 index equivalents
  + 

* COMPARE current Integer at left_index with the current Integer at right_index
  + we are comparing the value of both Integers
  + three possible outcomes:
    + Integer at left_index is greater than integer at right_index
    + Integer at left_index is less than integer at right_index
    + Integer at left_index is the same as the integer at right_index
* ACT on the comparison THIS IS THE KEY MOVE
  + IF integer at left_index > integer at right_index, the SHOVEL right_index to merged array AND increment right_index by one
  + IF integer at left_index < integer at right_index, then SHOVEL left_index to merged array but don't increment right_index
  + IF integer at left_index == integer at right index, then SHOVEL both integers to merged AND increment right_index
* STOP moving through both arrays when all integers have been compared
  + THIS IS THE MAIN PROBLEM
  + I AM GETTING EITHER THE MOVE STOPPING TOO EARLY OR AN INFINITE LOOP
* RETURN the merged array

---

## PART 2 - IMPLEMENT MERGE SORT

* SPLIT the array UNTIL there are just atomic subarrays
  + i.e. there are just subarrays of just one element
=end

require 'pry'
require 'pry-byebug'

def merge(left, right) # using a loop
  merged = []
  left_index = 0
  right_index = 0
  
  loop do
    
    if left[left_index] == nil
      merged << right[right_index]
      right_index += 1
    elsif right[right_index] == nil
      merged << left[left_index]
      left_index += 1
    elsif left[left_index] > right[right_index]
      merged << right[right_index]
      right_index += 1
    elsif left[left_index] < right[right_index]
      merged << left[left_index]
      left_index += 1
    elsif left[left_index] == right[right_index]
      merged << left[left_index]
      left_index += 1
      merged << right[right_index]
      right_index += 1
    end

    break if left[left_index] == nil && right[right_index] == nil
  end
  
  merged
end

def merge(left, right) # attempt at using an iterator; I ended up copying the official LS solution and use my own naming conventions
  merged = []
  right_index = 0
  left.each_index do |left_index|
    # binding.pry
    while right_index < right.size && right[right_index] <= left[left_index]
      merged << right[right_index]
      right_index += 1
    end
    merged << left[left_index]
  end
  # merged.concat(right[right_index..-1]) # push the remaining right elements to the merged
  # merged
  merged.push(right[right_index..-1]).flatten # my own version of above lines
end

def merge_sort(array)
  return array if array.size <= 1
  
  middle_index_plus_one = (array.size / 2)
  left = array[0...middle_index_plus_one]
  right = array[middle_index_plus_one..-1]
  
  left = merge_sort(left)
  right = merge_sort(right)
  
  return merge(left, right)
end

# my test cases

# p merge([1, 3], [2, 4]) == [1, 2, 3, 4]

# test cases from LS "merge sorted lists"

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]

# test cases from LS "merge sort" problem

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort([9, 2, 7, 6, 8, 5, 0, 1]) == [0, 1, 2, 5, 6, 7, 8, 9]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]