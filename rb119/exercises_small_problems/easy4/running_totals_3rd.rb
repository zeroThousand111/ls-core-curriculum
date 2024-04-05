# Problem
=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
=end

# Input: An Array of Integers
# Output: An Array of Integers

=begin
Explicit requirements:
  - return array has same number of elements as the input array
  - each subsequent element of the output array is formed of the running total of the values of the elements from the input array
  
Implicit requirements:
  - Empty input array is allowed
  - The Integers in the input array are not sorted in any order
  - the return array is a NEW array

=end

# Examples & Test Cases
=begin
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
=end

# Data Structure
# Arrays

# Algorithm
=begin
1. CREATE output array
2. CREATE running total local variable and assign it the value of the first element of the input array
  a. Use array element assignment
    i. running_total = input_array[0]
3. MOVE through the elements of the input array
  a. Could use a simple loop and index counter
    i. index = 0
  b. Could use #each
4. UPDATE the running total to add the current element of the input array
5. ADD the running total to the output array
6. FINISH when all elements of the input array have been added to the running total and the final value has been added to the output array
7. RETURN the output array

=end

# Code with intent!

require 'pry'
require 'pry-byebug'

# solution 1 - use a simple loop

def running_total(input_array)
  output_array = []
  return output_array if input_array.empty?
  running_total = 0
  
  
  index = 0
  loop do
    running_total += input_array[index]
    output_array << running_total
    index += 1
    break if index == input_array.size
  end
  
  output_array
end

# --------

# solution 2 - use an iterative method and block

def running_total(input_array)
  output_array = []
  running_total = 0
  
  input_array.each do |element|
    running_total += element
    output_array << running_total
  end
  
  output_array
end

# --------

# solution 3a - using #map

def running_total(input_array)
  running_total = 0
  input_array.map do |element|
    running_total += element
    running_total
  end
end

# solution 3b - using #map and refactored to be more concise

def running_total(input_array)
  running_total = 0
  input_array.map { |element| running_total += element }
end

# --------

# FURTHER EXPLORATION - Try solving this problem using Enumerable#each_with_object or Enumerable#reduce (note that Enumerable methods can be applied to Arrays).

# solution 4 - FURTHER EXPLORATION using #each_with_object

def running_total(input_array)
  running_total = 0
  input_array.each_with_object([]) do |element, array|
    running_total += element
    array << running_total
  end
end

# --------

# solution 5 - FURTHER EXPLORATION using #inject in a simple loop, but doesn't improve things much!

def running_total(input_array)
  output_array = []
  return output_array if input_array.empty?
  running_total = 0
  
  index = 0
  loop do
    running_total = input_array[0..index].inject(:+)
    output_array << running_total
    index += 1
    break if index == input_array.size
  end
  
  output_array
end

# --------

# Print Cases
p running_total([2, 5, 13]) # [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) # [14, 25, 32, 47, 67]

# Test Cases

# Further Exploration
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
