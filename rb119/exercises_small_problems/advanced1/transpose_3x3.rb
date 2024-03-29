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

INPUT: A 'matrix', which is actually an array of 3 subarrays, each containing 3 integers (so 9 elements in total)

OUTPUT:  A NEW array of 3 subarrays with the same values in a different order

The transposition from rows to colums follows this pattern:

input_matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

output_matrix = [
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9]
]

transposition_pattern = [
  [input_matrix[0][0], input_matrix[1][0], input_matrix[2][0]],
  [input_matrix[0][1], input_matrix[1][1], input_matrix[2][1]],
  [input_matrix[0][2], input_matrix[1][2], input_matrix[2][2]]
]

In other words, 

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

FURTHER EXPLORATION 

Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

Examples

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
This program should print "true" twice.

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.
  a.
    i.
2.
  a.
    i.
3.
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

# solution 1 - Brute force mapping using array element reference

def transpose(input_matrix)
  [
    [input_matrix[0][0], input_matrix[1][0], input_matrix[2][0]],
    [input_matrix[0][1], input_matrix[1][1], input_matrix[2][1]],
    [input_matrix[0][2], input_matrix[1][2], input_matrix[2][2]]
  ]
end

# -------------------

# solution 2 - Programatically mapping using simple loops

def transpose(input_matrix)
  
  second_counter = 0
  output_matrix = []
  
  loop do
    first_counter = 0
    subarray = []
    
    loop do 
      subarray << input_matrix[first_counter][second_counter]
      first_counter += 1
      break if first_counter > 2
    end
    
    output_matrix << subarray
    second_counter += 1
    break if second_counter > 2
  end
  
  output_matrix
end

# -------------------

# solution 3 - Programatically using #upto to iterate

def transpose(input_matrix)
  output_matrix = []
  
  0.upto(2) do |second_counter|
    subarray = []
    0.upto(2) do |first_counter|
      subarray << input_matrix[first_counter][second_counter]
    end
    output_matrix << subarray
  end
  
  output_matrix
end

# -------------------

# solution 4 - Programatically using #map ? Not sure its possible



# -------------------

# solution 5 - Official LS solution

def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# -------------------

# solution 6 - FURTHER EXPLORATION 

def transpose!(matrix)
  
end

# -------------------

# Print Tests

# Test Cases

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# FURTHER EXPLORATION Test Cases
transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

