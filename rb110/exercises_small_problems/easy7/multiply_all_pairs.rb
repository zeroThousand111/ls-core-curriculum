=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

INPUT: Two arrays of integers

OUTPUT: One array of integers

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - New array;
  - New array contains the product of every pair of numbers that is possible;
  - Output array must be sorted in increasing numerical order;
  - No empty arrays will be passed as arguments.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create new empty output_array
2.Iterate through every combination of values in both arrays:
  a.Take first value of first array, find product with first value of second;
  b.Take first value of first array, find product with second value of second;
  c. Continue b. until size of second array 
  d.Take second value of first array, find product
  e.Continue until size of first array.
3.Sort the output array values in increasing numerical order;
4.Return the output array.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use two nested simple loops

# def multiply_all_pairs(array1, array2)
#   output_array = []
#   counter1 = 0
  
#   loop do
#     counter2 = 0
    
#     loop do
#       output_array << array1[counter1] * array2[counter2]
#       counter2 += 1
#       break if counter2 == array2.size
#     end
    
#     counter1 += 1
#     break if counter1 == array1.size
#   end
#   output_array.sort
# end

# solution 2 - use #each nested as solution 1 above

# def multiply_all_pairs(array1, array2)
#   output_array = []
  
#   array1.each do |i|
#     array2.each do |e|
#       output_array << i * e
#     end
#   end
  
#   output_array.sort
# end

# solution 3 - use #map

def multiply_all_pairs(array1, array2)
  output_array = []
  
  array1.each do |i|
    array2.each do |e|
      output_array << i * e
    end
  end
  
  output_array.sort
end


# Print Tests
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) # [2, 4, 4, 6, 8, 8, 12, 16]

# Test Cases
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]