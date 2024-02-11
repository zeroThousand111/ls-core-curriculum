=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

INPUT: An array of numbers or an array of strings

OUTPUT: The same array, mutated and sorted

RULES
EXPLICIT REQUIREMENTS:
  - The sorting must be a bubble sort
  - The array will contain at least 2 elements
  -
  
IMPLICIT REQUIREMENTS:
  -
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

Array
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. FIRST PASS through the array 
2. COMPARE elements at indices 0 and 1
3. if element[0] > element[1], delete element[0] and insert it at element[1]
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - My 1st solution using a simple loop within an until loop

# def bubble_sort!(array)
#   until array == array.sort
#   counter = 0
#     loop do
#       if array[counter] > array[counter + 1]
#         array.insert(counter + 1, array.delete_at(counter))
#       end
#       counter += 1
#       break if counter == array.size - 1
#     end
#   end
#   array
# end

# -------------------

# solution 2 - Official LS Solution

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

# solution 3 - Using the Ruby swap in my solution

# def bubble_sort!(array)
#   until array == array.sort
#   counter = 0
#     loop do
#       if array[counter] > array[counter + 1]
#         array[counter], array[counter + 1] = array[counter + 1], array[counter]
#       end
#       counter += 1
#       break if counter == array.size - 1
#     end
#   end
#   array
# end

# -------------------

# solution 4 - Writing the LS solution from memory and first principles

def bubble_sort!(array)
  loop do 
    finished = false
    1.upto(array.size - 1) do |index|
      # binding.pry
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      finished = true
    end
  
    break unless finished
  end
  array
end


# -------------------

# Print Tests

# Test Cases
array = [5, 3]
p bubble_sort!(array) == [3, 5]
# array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array) == [1, 2, 4, 6, 7]
# array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)