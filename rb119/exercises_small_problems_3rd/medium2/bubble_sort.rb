=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

# UNDERSTAND THE PROBLEM

## REFRAME THE PROBLEM
Sort an array of objects and return a mutated calling object array with the objects sorted according to ascending numerical or alphabetical order.  The way the objects shall be sorted will be the "bubble sort" procedure.

## Input: An array of integers or strings
## Output: The same array mutated with objects in ascending numerical or alphabetical order

## Rules
### Explicit Requirements:
  - Return a mutated array, not a new array
  - Objects must be sorted numerically or alphabetically
  - The way the sorting must be done must be the bubble sort method
  - 
### Implicit Requirements:
  - It's not clear if the method should handle empty arrays, or arrays containing other kinds of objects

# EXAMPLES/TEST CASES

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# DATA STRUCTURES
Arrays

# ALGORITHM

* Create a SWITCH 
    - switch = false
* Make multiple MOVES through the array UNTIL the array is sorted
  + how will we know the array is sorted?  A pass through the array where nothing is changed?  Use a SWITCH to track if there have been any changes made to the array on a given iteration.  Trip the switch when a change is made to the array.
  + use a loop?
  + use an iterator?
* MOVE through every object in the array UNTIL reach the penultimate object
  + use a loop? or an iterator?
  + need to track current object and next object (index + 1)
* COMPARE the current object and the next object for order
  + use comparison operator
* ACT upon the result of the above comparison
  + IF array[index] > array[index + 1], then make a change using multiple parallel assignment
    - array[index], array[index + 1] = array[index + 1], array[index] if array[index] > array[index + 1]
  + IF there has been a change made to the array, then trip the switch
    - switch = true
* RETURN mutated array when the outer loop is broken when switch remains assigned to false i.e. when an iteration doesn't make a mutating change to the array
=end

# solution 1 - using two nested simple loops

def bubble_sort!(array)
  loop do 
    switch = false
    
    index = 0
    loop do 
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        switch = true
      end
      index += 1
      break if index == array.size - 1
    end
    
    break if switch == false
  end
  array
end

# solution 2 - using a simple loop and an iterator for the inner loop (#upto)

def bubble_sort!(array)
  loop do 
    switch = false
    
    0.upto(array.size - 2) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        switch = true
      end
    end
    
    break if switch == false
  end
  array
end

# solution 3 - using a simple loop and an iterator for the inner loop (#each)

def bubble_sort!(array)
  loop do 
    switch = false
    
    (0..array.size - 2).each do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        switch = true
      end
    end
    
    break if switch == false
  end
  array
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)