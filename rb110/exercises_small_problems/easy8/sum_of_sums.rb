=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

INPUT: An Array of numbers

OUTPUT: An integer

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - The return is the sum of the sums of each leading subsequence
  - Assume that the Array is never empty.
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35


______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty list for sums sum_array
2.Populate sum_array list with sums of input_array elements:
  a. First sum = input_array index 0
  b. Second sum = index 0 + index 1
  c. Third sum = index 0 + index 1 + index 2
d. Continue until all last sum is the sum of all input_array elements
3. Sum the sum_array and return
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - simple loop

# def sum_of_sums(input_array)
#   sum_of_sums = 0
#   sum = 0
  
#   element_counter = 0
  
#   # loop to build array of sums
#   loop do
#     sum += input_array[element_counter]
#     sum_of_sums += sum
    
#     element_counter += 1
#     break if element_counter == input_array.size
#   end
#   sum_of_sums
# end

# solution 2 - use #each

# def sum_of_sums(input_array)
#   sum_of_sums = 0
#   sum = 0
  
#   input_array.each do |element|
#     sum += element
#     sum_of_sums += sum
#   end
  
#   sum_of_sums
# end

# solution 3 - multiplication of reverse index number

# def sum_of_sums(input_array)
#   reverse_counter = (input_array.size)
#   multiplier = 1
#   sum = 0
#   loop do 
#     sum += (input_array[-multiplier] * multiplier)
#     reverse_counter -= 1
#     multiplier += 1
#     break if reverse_counter == 0
#   end
#   sum
  
# end

# solution 4 - same as 3 but using #each

# def sum_of_sums(input_array)
#   sum = 0
#   multiplier = input_array.size
#   input_array.each_with_index do |element, index|
#     sum += (element * multiplier)
#     multiplier -= 1
#   end
#   sum
# end

# solution 5 - official LS solution 2 - use Integer#upto and Enumerable#inject

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end
    

# Print Tests
p sum_of_sums([3, 5, 2])

# Test Cases

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35