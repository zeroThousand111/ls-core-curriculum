=begin
Implement Bubble Sort
The Problem
This is the first of several challenges on sorting algorithms. Given an array of unsorted items, we want to be able to return a sorted array. We will see several different methods to do this and learn some tradeoffs between these different approaches. While most modern languages have built-in sorting methods for operations like this, it is still important to understand some of the common basic approaches and learn how they can be implemented.

Here we will see bubble sort. The bubble sort method starts at the beginning of an unsorted array and 'bubbles up' unsorted values towards the end, iterating through the array until it is completely sorted. It does this by comparing adjacent items and swapping them if they are out of order. The method continues looping through the array until no swaps occur at which point the array is sorted.

This method requires multiple iterations through the array and for average and worst cases has quadratic time complexity. While simple, it is usually impractical in most situations.

Instructions: Write a function bubbleSort which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest.

Test Cases
# Explicit requirements:
- `bubble_sort` should be a method.
- `bubble_sort` should return a sorted array (least to greatest).
- `bubble_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92])` should return an array that is unchanged except for order.
- `bubble_sort` should not use the built-in `.sort()` method.

N.B. Write my own simple test cases

# ALGORITHM

* CREATE a switch that is false, but switches to true whenever a change is made to the array
* CREATE outer loop that repeats until switch remains false at the end of a pass through the array
* CREATE an inner loop that cycles through each element of the input array until it reaches the penultimate element
  + could use a simple loop, but I will use #upto
  + start_index = 0
  + stop_index = array.size - 2
    - start_index.upto(stop_index) do |index|
* MOVE through the array of elements using the two nested loops above
* COMPARE element at current index with element at index + 1
* ACT on the result of the comparison
  + IF array[index] <= array[index + 1], then do nothing
  + IF array[index] > array[index + 1], then use multiple parallel reassignment on both elements to move them to different indexes in the array AND reassign switch to true
    - array[index], array[index + 1] = array[index + 1], array[index] 
* FINISH iterating through the array, and BREAK if switch is still false i.e. if the 

# IMPROVING performance by discounting tail elements that have bubbled up
* CREATE counter that moves up by 1 on every iteration of the inner loop
* reassign stop index to ((array.size - 2) - counter) on every iteration to ignore last digits that have bubbled up
=end

def bubble_sort!(array)
  
  loop do
    switch = false
    start_index = 0
    stop_index = array.size - 2
    start_index.upto(stop_index) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        switch = true
      end
    end
    break if switch == false
  end
  array
end

# improved performance ignoring elements bubbling up

def bubble_sort!(array)
  
  loop do
    switch = false
    counter = 0
    start_index = 0
    stop_index = array.size - 2 - counter # progressively comparing fewer elements on each iteration
    start_index.upto(stop_index) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        switch = true
      end
    end
    counter += 1
    break if switch == false
  end
  array
end

p bubble_sort!([3, 1, 2]) == [1, 2, 3]
p bubble_sort!([5, 3, 2, 1, 4]) == [1, 2, 3, 4, 5]
p bubble_sort!(["b", "c", "a", "z"]) == ["a", "b", "c", "z"]

# does it mutate? Yes!

# test_array = 4, 3, 2, 1, 0
# p bubble_sort!(test_array)
# p test_array