=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

INPUT: A nested array that models a matrix

OUTPUT: A nested array that models a matrix with the same elements as the input array, but with 'rows' and 'columns' reversed

RULES
EXPLICIT REQUIREMENTS:
  - Modify your transpose method from the previous exercise
  - input array will have at least 1 row and 1 column
  - input array (and by implication output array) may not have an equal number of rows and columns.  In other words they may not be 'square matrices'
  
IMPLICIT REQUIREMENTS:
  - The sizes of rows and columns in the matrix will be the same; there won't be unequal sized rows or columns.
  - What is a 'row'?  In the nested array, each 'row' is represented as a subarray.
  - What is a 'column'? In the nested array, each 'column' is represented as elements of each subarray with the same corresponding index numbers
  - The number of the row is represented as the index of the subarray in the nested array and the number of the column by the element index in each subarray.  In other words, array[row][column].
  - Brute force mapping of each element won't work, because the number of rows and columns of the input array is unknown (other than at least 1 row and 1 column), so the solution must be programatic.

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]

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

# array[row][column]

# solution 1 - Programatically mapping using simple loops

def transpose(input_matrix)
  number_of_rows = input_matrix.size
  number_of_columns = input_matrix[0].size
  column_counter = 0
  output_matrix = []
  
  loop do
    row_counter = 0
    row = []
    
    loop do
      # binding.pry
      row << input_matrix[row_counter][column_counter]
      row_counter += 1
      break if row_counter == number_of_rows
    end
    
    output_matrix << row
    column_counter += 1
    break if column_counter == number_of_columns
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
    0.upto(number_of_rows - 1) do | row_index |
      row << input_matrix[row_index][column_index]
    end
    output_matrix << row
  end
  
  output_matrix
end

# -------------------

# solution 3 - Modifiying the Official LS Solution from the previous exercise

def transpose(matrix)
  max_row_index = matrix.size - 1
  max_column_index = matrix[0].size - 1
  result = []
  (0..max_column_index).each do |column_index|
    new_row = (0..max_row_index).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# -------------------

# solution 4 - Official LS Solution to this exercise - much the same as mine above but clever use of an EXCLUSIVE range to get max index number for rows and column

def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

# Test Case from previous exercise

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]