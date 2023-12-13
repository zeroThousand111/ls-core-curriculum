=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

INPUT: An array

OUTPUT: An array containing two nested arrays

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Returns a nested array of two array elements;
  - If original array element number is odd, first nested array contains the middle element.
  
IMPLICIT REQUIREMENTS:
  - No change to index order of elements;
  - Return is a new array, not a mutated array
  - An empty array creates two empty nested arrays as a return

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Count number of elements in input array;
2. Calculate halfway index: 
  a. if odd, halfway index is the number of elements divided by 2 (integers round down);
  b. if even, halfway index is the number of elements divided by 2 minus 1;
3. Create empty arrays;
  a. Create empty array for first half of numbers;
  b. Create empty array for second half of numbers
4. Push numbers into respective arrays
a. Push numbers up to and equal to 
5.Return an array containing two sub arrays, first and second
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - if statement then using two loops

# def halvsies(array)
#   if array.size.odd?
#     halfway_index = (array.size / 2) + 1
#   else 
#     halfway_index = array.size / 2
#   end
  
#   first = []
#   second =[]
#   counter = 0
  
#   loop do
#     first << array[counter] unless array[counter] == nil
#     counter += 1
#     break if counter >= halfway_index
#   end
  
#   counter = halfway_index
  
#   loop do
#     second << array[counter] unless array[counter] == nil
#     counter += 1
#     break if counter >= array.size
#   end
  
#   [first, second]
# end

# solution 2 - ternery statement with #select and #with_index chained together

# def halvsies(array)
  
#   halfway_index = array.size.odd? ? array.size / 2 : (array.size / 2) - 1
  
#   first = []
#   second =[]
  
#   first = array.select.with_index do |_, index|
#               index <= halfway_index
#             end
  
#   second = array.select.with_index do |_, index|
#               index > halfway_index
#             end
  
#   [first, second]
# end

# solution 3 - using Enumerable#partition

# def halvsies(array)
#   halfway_index = array.size.odd? ? array.size / 2 : (array.size / 2) - 1
  
#   first, second = array.partition.with_index do |_, index|
#                     index <= halfway_index
#                   end
#   [first, second]
# end

# solution 4 - official LS solution

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end



# print tests
p halvsies([1, 2, 3, 4]) # [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) # [[1, 5, 2], [4, 3]]
p halvsies([5]) # [[5], []]
p halvsies([]) # [[], []]

# test cases
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]