=begin
21. Find the Mine!
(​https://www.codewars.com/kata/528d9adf0e03778b9e00067e/train/ruby​)
6 kyu

You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your function will be square (NxN), and there will only be one mine in the array.

# PROBLEM
## INPUT: a 2D nested array representing an n x n grid, with zeroes representing squares and one single 1 representing a bomb
## OUTPUT: an array containing two Integer elements, representing the grid reference of the bomb
## RULES
### Explicit requirements:
  - a method called mineLocation
  - input is a 2D array
  - output is an array containing two grid references
  - only one bomb per input
  - input grid will always be square
  - return array is [row index, column index]
### Implicit requirements:
  - the grid references for columns and rows begins at zero (not 1)
  - 

# EXAMPLES TEST CASES
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0] i.e. row 0, column 0
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1] i.e. row 1, column 1 i.e. centre square of 3x3 grid
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1] 
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0] i.e. row 0, column 0
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]

# DATA STRUCTURES
The input 2D array represents a square grid:
[[row0], [row1], [row2]]
[[column1, column2, column3], [], []]



# ALGORITHM
## HIGH LEVEL
1. FIND row that bomb is in
2. FIND column that bomb is in
3. RETURN array with grid coords


1. FIND row that bomb is in
* MOVE through the outer array from the first subarray to the last subarray
  + use each_with_index, parameter is row_index
* MOVE through the current subarray from first digit to the last digit
  + use each_with_index, parameter is column_index
* DETERMINE if current number is 1
  + use ==
    - if num == 1
* IF number is 1
  + assign row number (index of subarray) to row, 
  + use if statement
    - if num == 1,  RETURN [row_index, column_index]
  + ELSE move on
* STOP moving through subarrays and array after every digit searched OR shortcut finish?
* RETURN a new array [row, column]
=end

def mineLocation(grid)
  grid.each_with_index do |subarray, row_index|
    subarray.each_with_index do |num, column_index|
        if num == 1
          return [row_index, column_index]
        end
    end
  end
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0] 
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1] 
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1] 
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]