=begin
# Problem
Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

## Input: An array
## Output: A sorted array (new or the same?)
## Rules:
### Explicit requirements
  - Sorted array returned
  - Bubble sort methodology used, not anything else
  -
### Implicit requirements
  -
  -
# Examples/Test Cases

> bubble_sort([4,3,78,2,0,2])
=> [0,2,2,3,4,78]

# Data Structures
Arrays

# Algorithms

# STRATEGY 1 - USE A SWITCH TO DETECT IF THERE HAS BEEN A CHANGE MADE TO THE ARRAY ON THAT LOOP THROUGH
  
  - MOVE through the pairs of arrays
    - use nested loops
    - use nested #each_with_index? iterators (but how to stop on penultimate element?)
    - use nested upto loops (stopping on last pair, not last element with highest index)
  - CREATE a switch that checks if any change has been made on each loop through the array
    - changed_array = false
  - COMPARE values of each pair
    - left_value > right_value
  - ACT upon the comparison
    - IF left value higher than right, swap them AND change value of change_check switch to true
     - use multiple parallel reassignment
       - e.g. array[index], array[index + 1] = array[index + 1], array[index]
       - changed_array = true
    - IF not (right already higher than left, or both the same) then do nothing
  - REPEAT moving through the pairs of values in the array, UNTIL 
  - BREAK out of loop if changed_array switch is false
  
  # STRATEGY 2 - LOOP n-1 TIMES (where n is the number of elements)
  
  
  
  # STRATEGY 3 - STRATEGY 2, But with optimised sorting for performance (on loop 2, don't check element pair [-2, -1], on loop 3, don't check pairs [-3, 2] and [-2, -1])
  
  

=end

# Code
require 'pry'
require 'pry-byebug'

# STRATEGY 1 - USE A SWITCH

def bubble_sort(array)
  loop do
    index = 0
    changed_array = false
    loop do
    
    left_value = array[index]
    right_value = array[index + 1]
    # p [left_value, right_value]
    # binding.pry
    if left_value > right_value
      array[index], array[index + 1] = array[index + 1], array[index]
      changed_array = true
    end
    
    index += 1
    break if index == array.size - 1
  end
  
  break if changed_array == false
  end
  
  array
end

# STRATEGY 2 - USE THE n-1 STRATEGY

def bubble_sort(array)
  n_minus_one = array.size - 1
  n_minus_one.times do
    index = 0
    loop do 
      left_value = array[index]
      right_value = array[index + 1]
      if left_value > right_value
        array[index], array[index + 1] = array[index + 1], array[index]
      end
      index += 1
      break if index == n_minus_one
    end
  end
  array
end

# STRATEGY 3 - n-1 STRATEGY with optimisation

def bubble_sort(array)
  n_minus_one = array.size - 1
  
  halt = 0
  n_minus_one.times do
    
    index = 0
    loop do
      left_value = array[index]
      right_value = array[index + 1]
      if left_value > right_value
        array[index], array[index + 1] = array[index + 1], array[index]
      end
      index += 1
      break if index == n_minus_one - halt
    end
    
    halt += 1
  end
  
  array
end

p bubble_sort([4,3,78,2,0,2]) #[0,2,2,3,4,78]
p bubble_sort([4,3,78,2,0,2]) == [0,2,2,3,4,78]