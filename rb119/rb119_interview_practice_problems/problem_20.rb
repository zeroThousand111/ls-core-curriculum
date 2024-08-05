=begin
Problem 20
Create a method that takes an array of numbers, all of which are the same except one. Find and return the number in the array that differs from all the rest.

The array will always contain at least 3 numbers, and there will always be exactly one number that is different.

# PROBLEM
## INPUT: an array of integers
## OUTPUT: an integer, the one that is not the same as the others
## RULES
### EXPLICIT REQUIREMENTS
  - find the integer that is not the same as the others in the input array and return it
  - array will always contain at least 3 numbers and always 1 will be different
  
### IMPLICIT REQUIREMENTS
  - the different integer can be at the first index, last index or an index inbetween
  - all integers in the test cases are either positive or zero
  
# EXAMPLES

Examples

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3
The above tests should each print true.

# DATA STRUCTURES
input: an array of integers
output: an integer
intermediate: probably not needed?

# BRAINSTORM

- what is different?
  - the value of the element
- what is it different to?
  - ALL the other elements

# ALGORITHM
## HIGH-LEVEL
1. Move through the array of integers, from the first to the last
2. Return the current integer, IF ALL of the OTHER elements are equal to one another, or, in other words, are NOT EQUAL to the current integer

## DETAIL
1. Move through the array of integers, from the first to the last
* Move through the array using an interator
  + use #each_with_index
2. Return the current integer, IF ALL of the OTHER elements are equal to one another
* CREATE a new sub array of elements that has all of the elements of the input array, minus the current element at index
  * Create an empty array
  * SHOVEL each element into it UNLESS the index is current index
* TEST if all of the elements NOT the same
  + looking for a false condition
  + subarray.all? { |element| element != num}
* RETURN current integer, if all of the elements in the subarray are not the same as the current integer
=end

def what_is_different(array)
  array.each_with_index do |num1, index1|
    subarray = (array.select.with_index do |num2, index2|
                    index2 != index1
                  end)
    return num1 if subarray.all? { |num3| num3 != num1}
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3

