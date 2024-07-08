=begin
26. Mean Square Error
(​https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby​) 
Complete the function that
accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair. 

# PROBLEM
## INPUTS: two arrays of equal length, containing Integers
## OUTPUTS: a number: either an Integer or a Float
## RULES
### Explicit requirements:
  - two arguments: each an array of integers, each the same size
  - compare the value of the two integers at the same index position in both arrays, square the difference between them
  - return the average value of those squared differences
### Implicit requirements:
  - Integers can be negative as well as positive
  - return can be an Integer or a float

Examples
[1,2,3],[4,5,6] --> 9 because(9+9+9)/3
[10,20,10,2],[10,25,5,-2] --> 16.5because(0+25+25+16)/4
[-1,0],[0,-1] --> 1 because(1+1)/2

# DATA STRUCTURES
- Arrays of integers
Intermediate: an array of squared differences

# ALGORITHM
* CREATE an empty array of squared difference values
* MOVE through both input arrays, one index position at a time
* CALCULATE the difference between the two integers, then square it, then SHOVEL that result into the array of squared differences
  + because the differences are squared, it doesn't matter which way around the differences are calculated
  + e.g. 1 - - 5 = -4, -5 - +1 is -4
* STOP moving through the input arrays
* SUM the calues in the array of squared differences then divide them by the number of elements in that array
* DETERMINE if above division operation results in a whole number or not
  + IF YES then convert float to an Integer
* RETURN the value as an Integer, or float
=end

def solution(arr1, arr2)
  array_of_squared_differences = []
  0.upto(arr1.size - 1) do |index|
    array_of_squared_differences << (arr1[index] - arr2[index])**2
  end
  mean = array_of_squared_differences.sum / array_of_squared_differences.size.to_f
  if array_of_squared_differences.sum % array_of_squared_differences.size == 0
    return mean.to_i
  end
  mean
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1