=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6
can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:


3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5
is:

9  3
7  4
5  1
Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.


INPUT: A nested array, representing a matrix

The syntax of array[subarray][element] in the context of the matrices means  matrix[row][column]

OUTPUT: A nested array, representing a matrix that is equivalent to the input matrix being "rotated" 90 degrees to the right aka 90 degrees clockwise

input_matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

output_matrix = [
  [3, 4, 1], 
  [9, 7, 5],
  [6, 2, 8]
]

Brute force mapping of the input_matrix for this would be:

output_matrix = [
  [input_matrix[2][0], input_matrix[1][0], input_matrix[0][0]], 
  [input_matrix[2][1], input_matrix[1][1], input_matrix[0][1]],
  [input_matrix[2][2], input_matrix[1][2], input_matrix[0][2]]
]

The relationship between in the input_matrix and output_matrix indices are:

[
  [out[0][0]—in[2][0], out[0][1]-in[1][0], out[0][2]-in[0][0]], 
  [out[1][0]-in[2][1], out[1][1]-in[1][1], out[1][2]-in[0][1]],
  [out[2][0]-in[2][2], out[2][1]-in[1][2], out[2][2]-in[0][2]]
]

So some patterns come to light from this mapping:
- the first row (subarray) of the output matrix is built from the first column reversed of the input matrix
- every next row (subarray) of the output matrix is built from the next column of the input matrix reversed
- The first column of the output matrix is built from the last row (subarray) of the input matrix
- The next column of the output matrix is built from the penultimate row (subarray) of the input matrix

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - is the return a NEW matrix or a MUTATED calling object?
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
This program should print "true" three times.

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

# The syntax of array[subarray][element] in the context of the matrices means  matrix[row][column]
# - the first row (subarray) of the output matrix is built from the first column reversed of the input matrix
# - every next row (subarray) of the output matrix is built from the next column of the input matrix reversed

# solution 1 - Programatically mapping using simple loops

def rotate90(input_matrix)
  number_of_rows = input_matrix.size
  number_of_columns = input_matrix[0].size
  output_matrix = []
  row_counter = 0
  
  loop do 
    decreasing_column_counter = number_of_rows - 1
    row = []
    
    loop do
      row << input_matrix[decreasing_column_counter][row_counter]
      decreasing_column_counter -= 1
      break if decreasing_column_counter < 0
    end
    
    output_matrix << row
    row_counter += 1
    break if row_counter == number_of_columns
  end
  
  output_matrix
end

# -------------------

# solution 2 - Programatically using #upto to iterate

def transpose(input_matrix)
  number_of_rows = input_matrix.size
  number_of_columns = input_matrix[0].size
  output_matrix = []
  
  0.upto(number_of_columns - 1) do | column_index |
    row = []
    (number_of_rows - 1).downto(0) do | row_index |
      row << input_matrix[row_index][column_index]
    end
    output_matrix << row
  end
  
  output_matrix
end

# -------------------

# solution 3 - Modifiying the Official LS Solution from the previous exercise

def transpose(matrix)
  number_of_rows = matrix.size
  number_of_columns = matrix[0].size
  result = []
  (0...number_of_columns).each do |column_index|
    new_row = ((number_of_rows - 1)..0).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# -------------------

# solution 4 - Official LS Solution to this exercise 

def rotate90(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end

# solution 5 - FURTHER EXPLORATION - A method that rotates 90, 180, 270 or 360 degrees

def rotate_n_degrees(matrix, degrees)
  case degrees
  when 90 then return rotate90(matrix)
  when 180 then return rotate90(rotate90(matrix))
  when 270 then return rotate90(rotate90(rotate90(matrix)))
  when 360 then return rotate90(rotate90(rotate90(rotate90(matrix))))
  # or when 360 return matrix 
  end
end

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# p new_matrix1 = rotate90(matrix1)
# p new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2
# This program should print "true" three times.

# Test Cases FURTHER EXPLORATION

p rotate_n_degrees(matrix1, 90) # [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p rotate_n_degrees(matrix1, 90) == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]

p rotate_n_degrees(matrix1, 180) # 

p rotate_n_degrees(matrix1, 270) # 

p rotate_n_degrees(matrix1, 360) # [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
p rotate_n_degrees(matrix1, 360) == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]