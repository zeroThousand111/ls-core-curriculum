=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

INPUT: An unordered array

OUTPUT: An integer

RULES
EXPLICIT REQUIREMENTS:
  - Write a method;
  - Return the duplicate value;
  -
  
IMPLICIT REQUIREMENTS:
  - Elements of the array may be Integers;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create an empty array (a list)
2. Loop through the input_array
3. Push each element of the input_array onto the new array;
4. Before pushing each element, check to see if that value is already in the new array;
5. If it is, return that value.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a basic loop

# def find_dup(input_array)
#   new_array = []
#   counter = 0
#   loop do
#     if new_array.include?(input_array[counter])
#       return input_array[counter]
#     else
#       new_array << input_array[counter]
#     end
#     counter += 1
#     break if counter == input_array.size
#   end
# end

# solution 2 - using #each

# def find_dup(input_array)
#   new_array = []
  
#   input_array.each do |element|
#     if new_array.include?(element)
#       return element
#     else
#       new_array << element
#     end
#   end
# end

# solution 3 - official LS solution

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

# print cases
p find_dup([1, 5, 3, 1]) # 1

# test cases
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73