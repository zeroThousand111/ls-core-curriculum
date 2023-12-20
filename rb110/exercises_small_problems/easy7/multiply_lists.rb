=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

INPUT: Two arrays

OUTPUT: One array

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create a new output array
2.Take first integer from 0 index of input_array1 and multiply it with integer at index 0 of input_array2
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - simple loop

# def multiply_list(array1, array2)
#   output_array = []
#   counter = 0
  
#   loop do 
#     output_array << (array1[counter] * array2[counter])
#     counter += 1
#     break if counter == array1.size
#   end
#   output_array
# end


# solution 2 - use #each and #with_index to do the same as solution 1

# def multiply_list(array1, array2)
#   output_array = []
  
#   array1.each.with_index do |element, index|
#     output_array << element * array2[index]
#   end
  
#   output_array
# end

# solution 3 - use #map and #with_index

# def multiply_list(array1, array2)
  
#   array1.map.with_index do |element, index|
#     element * array2[index]
#   end
  
# end

# solution 4 - official LS solution (similar to my solution 2)

# def multiply_list(list_1, list_2)
#   products = []
#   list_1.each_with_index do |item, index|
#     products << item * list_2[index]
#   end
#   products
# end

# solution 5 a b & c - using Array#zip

# def multiply_list(array1, array2)
#   arr =[]
#   array1.zip(array2) { |sub_array| arr << sub_array[0] * sub_array[1] }
#   arr
# end

# def multiply_list(array1, array2)
#   array1.zip(array2).map { |sub_array| sub_array[0] * sub_array[1] }
# end

def multiply_list(array1, array2)
  array1.zip(array2).map { |sub_array| sub_array.inject(:*) }
end


# Print Tests
p multiply_list([3, 5, 7], [9, 10, 11]) # [27, 50, 77]

# Test Cases

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]