=begin
________________________________________________________________________________
*****Understand the PROBLEM*****
________________________________________________________________________________
THE PROBLEM:
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

INPUT: Two arrays

OUTPUT: One array

RULES
EXPLICIT REQUIREMENTS:
  - Write a method;
  - Two arrays as arguments to the method;
  - No duplicate values in the returned Array
  - 
  
IMPLICIT REQUIREMENTS:
  - Implied NEW array returned not a mutated array;
  - Implied sorted value order
  -

________________________________________________________________________________
*****EXAMPLES/TEST CASES*****
________________________________________________________________________________

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

________________________________________________________________________________
*****DATA STRUCTURES*****
________________________________________________________________________________

Arrays
________________________________________________________________________________
*****ALGORITHM*****
________________________________________________________________________________

Two options for duplicates: a) remove them after merging the two arrays or b) don't include duplicate values.  I'll go for b) in the first instance.

1. Create new array;
2. Loop through first array and push/shovel each element to new array, unless that value is already in the new array;
3. Loop through second array and push/shovel each element to new array, unless that value is already in the new array;
4. Return new array.
5. (Sort new array numerically?)
________________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use two loops, one for each input array

# def merge(array1, array2)
#   new_array = []
#   counter = 0
  
#   loop do
#     new_array << array1[counter] unless new_array.include?(array1[counter])
#     counter += 1
#     break if counter == array1.size
#   end
  
#   counter = 0
  
#   loop do
#     new_array << array2[counter] unless new_array.include?(array2[counter])
#     counter += 1
#     break if counter == array1.size
#   end
  
#   new_array
# end


# solution 2 - use #each

# def merge(array1, array2)
#   new_array = []
  
#   array1.each do |i|
#     new_array << i unless new_array.include?(i)
#   end
  
#   array2.each do |i|
#     new_array << i unless new_array.include?(i)
#   end
#   new_array
# end

# solution 3 - official LS solution

def merge(array_1, array_2)
  array_1 | array_2
end

# test cases
p merge([1, 3, 5], [3, 6, 9]) # [1, 3, 5, 6, 9]
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]