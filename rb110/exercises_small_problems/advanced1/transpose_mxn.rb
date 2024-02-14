=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column

INPUT:

OUTPUT:

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

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

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

# solution 1 - Using two nested #Integer#upto loops 

def transpose(array)
  
  # measure the no of rows and columns of input array
  no_of_rows = array.size
  no_of_cols = array[0].size
  
  # make a blank transposed matrix
  # new_array no of columns and rows must be reversed from array
  new_array = []
  no_of_cols.times { new_array << [] } 
  
  # assign array values onto new_array by reversing first and second index references
  0.upto(no_of_cols) do |row_index|
    0.upto(no_of_rows) do |column_index|
      new_array[column_index][row_index] = array[row_index][column_index]
    end
  end
  
  p new_array
end

# -------------------

# solution 2 - Modifying Sedrick P's code from previous problem

# def transpose(matrix)
#   arr1, arr2, arr3 = matrix

#   matrix.map.with_index do |_, i|
#     [arr1[i], arr2[i], arr3[i]]
#   end
# end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p transpose([[1, 2, 3, 4]]) # [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) # [[1, 2, 3, 4]]

# Test Cases
# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]