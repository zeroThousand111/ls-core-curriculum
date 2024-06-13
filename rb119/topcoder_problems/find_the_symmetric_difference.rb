=begin
The mathematical term symmetric difference (△ or ⊕) of two sets is the set of elements which are in either of the two sets but not in both. For example, for sets A = {1, 2, 3} and B = {2, 3, 4}, A △ B = {1, 4}.

Symmetric difference is a binary operation, which means it operates on only two elements. So to evaluate an expression involving symmetric differences among three elements (A △ B △ C), you must complete one operation at a time. Thus, for sets A and B above, and C = {2, 3}, A △ B △ C = (A △ B) △ C = {1, 4} △ {2, 3} = {1, 2, 3, 4}.

Create a function [method] that takes two or more arrays and returns an array of their symmetric difference. The returned array must contain only unique values (no duplicates).

# UNDERSTAND THE PROBLEM

## Input: two or more arrays of integers
## Output: an array of integers
## Rules
### Explicit requirements:
  - a method;
  - two or more arguments, each an array of integers
  - symmetric difference operation on subsequent arrays of integers, i.e. first and second, then the result with the third, then the result with the fourth, etc.
  - each symmetric difference operation returns those elements that DO NOT appear in both arrays being compared (the opposite to appearing in both arrays)
  - The returned array must contain only unique values (no duplicates).
### Implicit requirements:
  - Whilst symmetric difference could be applied to arrays of any objects, the test cases are arrays of integers only; there are no other types of object
  - The elements are integers of values 1 to 9, not higher or lower
  - Some test cases have two array arguments, some have more

# EXAMPLES
Test Cases
sym([[1, 2, 3], [5, 2, 1, 4]]) == [3, 4, 5]
sym([[1, 2, 3, 3], [5, 2, 1, 4]]) == [3, 4, 5]
sym([[1, 2, 3], [5, 2, 1, 4, 5]]) == [3, 4, 5]
sym([[1, 2, 5], [2, 3, 5], [3, 4, 5]]) == [1, 4, 5]
sym([[1, 1, 2, 5], [2, 2, 3, 5], [3, 4, 5, 5]]) == [1, 4, 5]
sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]]) == [2, 3, 4, 6, 7]
sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]]) == [1, 2, 4, 5, 6, 7, 8, 9]

# DATA STRUCTURES
Arrays of integers

# ALGORITHM

* MOVE through the subarrays of the nested input arrays, comparing the first two first for a symmetric difference operation, then moving to the third array (if there is one)
  + use #upto
  + start_index = 1.  Use index to compare return_array with nested_array[index + 1]
  + stop_index = array.size - 1 i.e. the last element at index array.size - 1
  + define the symmetric difference operation as a helper method
  + array1 = nested_array[0], but after first iteration array1 = returned_array

* SYMMETRIC DIFFERENCE OPERATION
* CREATE an empty return array
* MOVE through the elements of array1 and determine if each element also is included in array2
* SHOVEL element to return array IF it exists in array1 but not in array2
* MOVE through the elements of array2 and determine if each element also is included in array1
* SHOVEL element to return array IF it exists in array2 but not in array1
* RETURN return array

* REMOVE duplicate values
  + this should be done after each symmetric difference operation to (slightly) improve performance with fewer elements to iterate over 
  + use Array#uniq

* SORT final return array
  + use Array#sort with no arguments or block

=end
require 'pry'
require 'pry-byebug'

def sym_diff_operation(array1, array2)
  return_array = []
  # binding.pry
  array1.each do |elem1|
    return_array << elem1 if !array2.include?(elem1)
  end
  array2.each do |elem2|
    return_array << elem2 if !array1.include?(elem2)
  end
  return_array.uniq
end

def sym(nested_array)
  return_array = nested_array[0]
  
  start_index = 1
  stop_index = nested_array.size - 1
  start_index.upto(stop_index) do |index|
    array1 = return_array
    array2 = nested_array[index]
    return_array = sym_diff_operation(array1, array2)
  end
  
  return_array.sort
end

# Test Cases
p sym([[1, 2, 3], [5, 2, 1, 4]]) == [3, 4, 5]
p sym([[1, 2, 3, 3], [5, 2, 1, 4]]) == [3, 4, 5]
p sym([[1, 2, 3], [5, 2, 1, 4, 5]]) == [3, 4, 5]
p sym([[1, 2, 5], [2, 3, 5], [3, 4, 5]]) == [1, 4, 5]
p sym([[1, 1, 2, 5], [2, 2, 3, 5], [3, 4, 5, 5]]) == [1, 4, 5]
p sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]]) == [2, 3, 4, 6, 7]
p sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]]) == [1, 2, 4, 5, 6, 7, 8, 9]

# p sym_diff_operation([1, 2, 3], [5, 2, 1, 4]) == [3, 4, 5]
# p sym_diff_operation([1, 2, 3], [5, 2, 1, 4, 5]) == [3, 4, 5]