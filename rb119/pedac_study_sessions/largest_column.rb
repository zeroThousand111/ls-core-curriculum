=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given a grid of values represented by an array of arrays, e.g.:
[1, 2, 3],
[4, 5, 6],
[7, 8, 9]

Return the largest sum of a column of values in the grid.
In this example, the largest sum is 18.

a = [[1, 2, 3],
[4, 5, 6],
[7, 8, 9]]

largest_column(a) == 18

b = [[1, 2, 3, 4],
[5, 6, 7, 8]]

largest_column(b) == 12

c = [[1, 0, 0],
[5, 8, 10],
[3, 5, 1]]

largest_column(c) == 13

INPUT: A two-dimensional array

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - Return is the sum of the column that sums to the largest amount;
  - 
  -
  
IMPLICIT REQUIREMENTS:
  - Column means those Integers at the same index number in each sub-array
  - Sum means the sum of the columns
  - Largest means highest numerical value
  - All columns will need to be summed to compare and find the largest sum
  - The return is not "which column?" but "what is the largest number?"

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

a = [[1, 2, 3],
[4, 5, 6],
[7, 8, 9]]

largest_column(a) == 18

b = [[1, 2, 3, 4],
[5, 6, 7, 8]]

largest_column(b) == 12

c = [[1, 0, 0],
[5, 8, 10],
[3, 5, 1]]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Two-dimensional nested arrays
Tally array - one dimensional
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an empty tally_array
2. Create counter
3. Create local variable sum
3. Loop through each sub-array
  a. sum = sub-array1[0] + sub-array2[0] + sub-array3[0],
  Then sum << tally_array
  b. sum = sub-array1[1] + sub-array2[1] + sub-array3[1]
  Then sum << tally_array
  c. etc.
  d. Increment counter by 1
  e. Break from loop when counter == sub-array1.size
4. Sort tally array by numerical value and return the last index i.e. highest number
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Original solution on the night, using a simple loop and inner #each

require 'pry'
require 'pry-byebug'

# def largest_column(array)
#   counter = 0
#   tally = []
  
#   loop do
#     sum = 0
#     array.each do |sub_array|
#       # binding.pry
#       sum += sub_array[counter]
#     end
#     tally << sum
#     counter += 1
#     break if counter == array[0].size
#   end

#   tally.sort.last
# end

# -------------------

# solution 2 - use two nested simple loops

# def largest_column(array)
#   sub_array_index = 0
#   tally = []
  
#   loop do
#     sum = 0
#     array_index = 0
    
#     loop do
#       sum += array[array_index][sub_array_index]
#       array_index += 1
#       break if array_index == array.size
#     end
    
#     tally << sum
#     sub_array_index += 1
#     break if sub_array_index == array[0].size
#   end
  
#   tally.sort.last
# end

# -------------------

# solution 3 - using #times and #each

def largest_column(array)
  tally = []
  sum = 0
  sub_array_size = array[0].size
  
  sub_array_size.times do |sub_array_index|
    sum = 0
    array.each do |sub_array|
      sum += sub_array[sub_array_index]
    end
  tally << sum
  end
  tally.max
end

# -------------------

# Print Tests

# Test Cases
a = [[1, 2, 3],
[4, 5, 6],
[7, 8, 9]]

p largest_column(a) == 18

b = [[1, 2, 3, 4],
[5, 6, 7, 8]]

p largest_column(b) == 12

c = [[1, 0, 0],
[5, 8, 10],
[3, 5, 1]]

p largest_column(c) == 13