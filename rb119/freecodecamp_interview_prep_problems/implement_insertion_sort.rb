=begin
The next sorting method we'll look at is insertion sort. This method works by building up a sorted array at the beginning of the list. It begins the sorted array with the first element. Then it inspects the next element and swaps it backwards into the sorted array until it is in sorted position. It continues iterating through the list and swapping new items backwards into the sorted portion until it reaches the end. This algorithm has quadratic time complexity in the average and worst cases.

**Instructions:** Write a function `insertionSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

I wasn't too clear on this explanation.  [Wikipedia](https://en.wikipedia.org/wiki/Insertion_sort) has a much fuller explanation.

# UNDERSTAND THE PROBLEM
## INPUT: an array of Integers
## OUTPUT: the SAME array of Integers, but elements sorted in ascending numerical order
## RULES
### Explicit requirements:
  - insertion_sort should be a method.
  - insertion_sort should return a sorted array (least to greatest).
  - insertion_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) should   return an array that is unchanged except for order.
  - insertion_sort([5, 4, 33, 2, 8]) == [2, 4, 5, 8, 33]
  - insertion_sort should not use the built-in `.sort()` method.

### Implicit requirements
  - the method will mutate the calling object;
  - assume that some arrays will have duplicate integers;
  - assume that some arrays will be empty;
  - 

# TEST CASES / EXAMPLES
Write my own, but basically the same object with elements sorted in ascending numerical order.

# DATA STRUCTURES
An array of integers

# ALGORITHM

* MOVE through the array from second index to the last until the element at the last index is reached
  + the element in question will be at current_index
  + use Array#upto
    - 1.upto(array.size - 1) do |current_index|
* On each ITERATION of the move
  * CREATE a local variable, insert_index and assign it initially to current_index
    - insert_index = current_index
  * MOVE backwards through the array and COMPARE with each element:
    + use Array#downto to iterate backwards (a nested iterator) from the (current_index - 1) down to 0
      - (current_index - 1).downto(0) do |back_index|
    + for each element, is the value of array[current_index] < array[back_index]
      + YES - reassign insert_index = back_index
      + NO - do nothing (insert_index will remain same as current_index)
  * STOP MOVING backwards along array when back_index is 0
  * REMOVE the element at current_index and INSERT it into the insert_index position
    + use Array#delete_at to remove it and Array#insert to insert it
      - array.insert(insert_index, array.delete_at(current_index)
    + if current_index value is greater, and doesn't need to be moved then it will be "moved" to insert index position, which is the same as current_index i.e. it will be removed and inserted back into the same index position
* STOP iterating when the last current_index is reached
* RETURN the (mutated) array.
=end

require 'pry'
require 'pry-byebug'

def insertion_sort(array)
  1.upto(array.size - 1) do |current_index|
    insert_index = current_index
   
    (current_index - 1).downto(0) do |back_index|
      if array[current_index] < array[back_index]
        insert_index = back_index
      end
    end
    
    array.insert(insert_index, array.delete_at(current_index))
  end
  
  array
end

p insertion_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]
p insertion_sort([2, 3, 1]) == [1, 2, 3]
p insertion_sort([1, 2, 3]) == [1, 2, 3]
p insertion_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])