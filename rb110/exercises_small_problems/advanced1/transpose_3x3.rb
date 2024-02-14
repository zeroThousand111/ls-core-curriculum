=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]


An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in matrix, you use Array#[] with both the row index and column index. So, in this case, matrix[0][2] is 8, and matrix[2][1] is 9. An entire row in the matrix can be referenced by just using one index: matrix[1] is the row (an Array) [4, 7, 2]. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

1  4  3
5  7  9
8  2  6

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Examples


INPUT: 
- A nested array of three elements;
- aka a two-dimensional array
- Each element is itself an array of 3 Integers;

OUTPUT: A two-dimensional array in the same format as the input array

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

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Nested arrays; 2D two-dimensional

1st order [[0], [1], [2]]
2nd order [[0, 1, 2],[0, 1, 2], [0, 1, 2]]
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

The brute force swaps are as follows:
  - array[0][0] - no change
    - in other words, array[0][0] = new_array[0][0]
  - array[0][1], array[1][0] - swap
    - i.e. array[0][1], array[1][0] = array[1][0], array[0][1] but this mutates the original array
  - array[0][2], array[2][0] - swap
  - array[1][0], array[0][1] - swap
  - array[1][1] - no change
  - array[1][2], array[2][1] - swap
  - array[2][0], array[0][2] - swap
  - array[2][1], array[1][2] - swap
  - array[2][2] - no change

So the transpose algorithm is to swap first array ref [] with second order array ref [].  In the case of those elements with the same number in both e.g. [2][2], swapping them around doesn't change their position in the new matrix

1.Create a new array with the structure [[], [], []]
  a.
    i.
2.Use array element assignment and array element reference to brute force map elements from the input_array into the new_array
  a.
    i.
3.Return the new_array
  a.
    i.
4.
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

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# solution 1 - Brute force array element reference and array element assignment

# def transpose(array)
#   new_array = [[],[],[]]
  
#   new_array[0][0] = array[0][0]
#   new_array[0][1] = array[1][0]
#   new_array[0][2] = array[2][0]
#   new_array[1][0] = array[0][1]
#   new_array[1][1] = array[1][1]
#   new_array[1][2] = array[2][1]
#   new_array[2][0] = array[0][2]
#   new_array[2][1] = array[1][2]
#   new_array[2][2] = array[2][2]
  
#   new_array
# end

# -------------------

# solution 2 - Using two simple loops

# def transpose(array)
#   new_array = [[],[],[]]
  
#   first_index = 0
#     loop do 
#       second_index = 0
#       loop do 
#         new_array[second_index][first_index] = array[first_index][second_index]
#         second_index += 1
#         break if second_index == 3
#       end
#       first_index += 1
#       break if first_index == 3
#     end
  
#   new_array
# end


# solution 3 - Using two nested #Integer#upto loops 

# def transpose(array)
#   new_array = [[],[],[]]
  
#   0.upto(2) do |first_index|
#     0.upto(2) do |second_index|
#       new_array[second_index][first_index] = array[first_index][second_index]
#     end
#   end
  
#   new_array
# end

# -------------------

# solution 4 - Official LS Solution

# def transpose(matrix)
#   result = []
#   (0..2).each do |column_index|
#     new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
#     result << new_row
#   end
#   result
# end

# -------------------

# solution 5 - from Sedrick P - love this

# def transpose(matrix)
#   arr1, arr2, arr3 = matrix

#   matrix.map.with_index do |_, i|
#     [arr1[i], arr2[i], arr3[i]]
#   end
# end

# -------------------

# Print Tests
# p new_matrix = transpose(matrix)

# Test Cases
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# solution 6 - Further Exploration | Brute Force Swapping of values

matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

def transpose!(array)
  array[0][1], array[1][0] = array[1][0], array[0][1]
  array[0][2], array[2][0] = array[2][0], array[0][2]
  array[1][2], array[2][1] = array[2][1], array[1][2]
  
  array
end

p transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
