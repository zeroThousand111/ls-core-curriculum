=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

INPUT: An array of numbers

OUTPUT: An array of numbers

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return is an array with same number of elements as input 
  -
  
IMPLICIT REQUIREMENTS:
  - The return is a new array, not a mutated argument
  - Empty arrays are allowed
  - Arrays of one element are allowed

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE a new empty array to be the return and ASSIGN the first integer of the input array
  a.
    i. return_array = []
2.Read the next (first) element of the input array and put it into the return array
  a. 
    i. return_array.push(running_total) 
  
2.READ the next (second) element of the input array
  a.Array element reference
    i. input_array[1]
3.SUM the next element of the input array and the element of the array to be returned and then assign it to the return array as the running total
  a.
    i.running_total = input_array[next] + return_array[-1]
    ii. return_array << running_total OR return_array.push(running_total) 
3.REPEAT steps 2-3 until all of input array has been read
  a. Use a simple loop OR
  b. Use #each on input_array
    i.
4.RETURN the new return array
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

# solution 1 - Using simple loops to iterate

# def running_total(input_array)
#   return_array = []
  
#   index = 0
#   loop do
#     break if index >= input_array.size
    
#     if index > 0
#       return_array << input_array[index] + return_array[-1]
#     else
#       return_array << input_array[index]
#     end
#     index += 1
#   end
  
#   return_array
# end

# -------------------

# solution 2 - Official LS solution using #map

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end

# -------------------

# solution 3 - Same as above but refactored with my terms

def running_total(input_array)
  running_total = 0
  input_array.map do |element| 
    running_total += element
  end
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p running_total([2, 5, 13]) # [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) # [14, 25, 32, 47, 67]
# p running_total([3]) # [3]

# Test Cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []