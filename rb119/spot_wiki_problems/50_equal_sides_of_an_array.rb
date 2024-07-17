=begin
50. Equal Sides Of An Array
(​https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby​)
Equal sides of an array
6 kyu

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:
Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem) Index 0 is the place where the left side and right side are equal.

Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.
Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.
Note:
If you are given an array with multiple answers, return the lowest correct index.
 
# PROBLEM
## INPUT: an array of integers
## OUTPUT: an Integer, representing the index point of "balance" in the input array where the sum of values to the left equals the sum of values to the right, or -1 if there is no mid-point
## RULES
### Explicit requirements:
  - return N, the index point of "balance" in the input array where the sum of values to the left equals the sum of values to the right, or -1 if there is no mid-point
  - Empty sub arrays are equal to 0
  

### Implicit requirements:
  - 

# EXAMPLES

# DATA STRUCTURES
INput: an array of integers
Output: an Integer
Intermediate: an array of subarrays?

# ALGORITHM
* MOVE through the input array from first index to the last
  + use #each_with_index
* For each index, CREATE an array of values to the left and an array to the right
* COMPARE the sums of left and right arrays
* ACT on comparison
  + IF the sums are equal, then RETURN the current index
  + ELSE move on to the next index
* STOP moving through the index and RETURN -1 as no balance index has been found
 
=end

def equal_sums?(left, right)
  left.sum == right.sum
end

def find_even_index(input_array)
  input_array.each_index do |index|
    left = input_array[0...index]
    right = input_array[(index + 1)..-1]
    return index if equal_sums?(left, right)
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1