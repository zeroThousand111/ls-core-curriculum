=begin

47. Array.diff
(​https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby​)
6 kyu
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.
It should remove all values from list a, which are present in list b.

# PROBLEM
## INPUT: two arrays of integers
## OUTPUT: an array of integers
## RULES
### Explicit requirements: 
  - a method:
  - the return is the first argument (array) with any elements present in the second argument removed
### Implicit requirements:
  - some arguments can be empty arrays
  - the presence of an element in the second array means removing ALL integers of that value in the first array

# EXAMPLES
If a value is present in b, all of its occurrences must be removed from the other:  array_diff([1,2],[1]) == [2]

p array_diff([1,2], [1]) == [2] # remove 1
p array_diff([1,2,2], [1]) == [2,2] remove 1
p array_diff([1,2,2], [2]) == [1] remove 2
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []

# DATA STRUCTURES

Input: two arrays of integers
Output: an array of integers

# ALGORITHM
* MOVE through the second array from first number to the last
  + name the parameter current_num
  + use #each
* MOVE through the first array from the first array to the last and REMOVE any element that matches current_num
  + could use #delete_if if it is mutating?
  + could use #select or #reject?
  
* RETURN the first array 
=end

def array_diff(array1, array2)
  array2.each do |num2|
    array1.delete_if do |num1|
      num1 == num2
    end
  end
  array1
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []