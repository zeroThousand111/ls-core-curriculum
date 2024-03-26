=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

6	2	7	1	4	Start: compare 6 > 2? Yes
2	6	7	1	4	Exchange
2	6	7	1	4	6 > 7? No (no exchange)
2	6	7	1	4	7 > 1? Yes
2	6	1	7	4	Exchange
2	6	1	7	4	7 > 4? Yes
2	6	1	4	7	Exchange
2	6	1	4	7	2 > 6? No
2	6	1	4	7	6 > 1? Yes
2	1	6	4	7	Exchange
2	1	6	4	7	6 > 4? Yes
2	1	4	6	7	Exchange
2	1	4	6	7	6 > 7? No
2	1	4	6	7	2 > 1? Yes
1	2	4	6	7	Exchange
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	1 > 2? No
1	2	4	6	7	2 > 4? No
1	2	4	6	7	4 > 6? No
1	2	4	6	7	6 > 7? No
1	2	4	6	7	No swaps; all done; sorted

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.


INPUT: An Array

OUTPUT: The same Array, sorted 

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - The return is not a new array, it is the same array, mutated
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.MOVE through each PAIR of elements, beginning with array(0) and array(1)
  a.Use a simple loop and index counter?
  b.How do you know when to stop?
    i.
2.COMPARE each PAIR in turn
  a.
    i.
3.IF the pair are not in numerical/alphabetical order, then switch them around into that order
  a.Use multiple parallel assignment
    i.a, b = b, a
4.STOP moving through the pairs when every pair hasn't needed to be reassigned
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - this uses a sorted array to compare with the mutated array to know when to stop looping, is this cheating??!

def bubble_sort!(array)
  sorted_array = array.sort
  
  loop do 
    first_element = 0
    second_element = 1
    
    loop do
      if array[first_element] > array[second_element]
        array[first_element], array[second_element] = array[second_element], array[first_element]
      end
      first_element += 1
      second_element += 1
      break if second_element == array.size
    end
    
    break if array == sorted_array
  end
  array
end

# -------------------

# solution 2 - using a switch local variable with a boolean value to determine when outer loop stops

def bubble_sort!(array)
  
  loop do 
    stop = true
    first_element = 0
    second_element = 1
    
    loop do
      if array[first_element] > array[second_element]
        array[first_element], array[second_element] = array[second_element], array[first_element]
        stop = false
      end
      
      first_element += 1
      second_element += 1
      break if second_element == array.size
    end
    
    break if stop == true
  end
  array
end

# -------------------

# solution 3 - Official LS solution

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]
# 
array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
# 
array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)