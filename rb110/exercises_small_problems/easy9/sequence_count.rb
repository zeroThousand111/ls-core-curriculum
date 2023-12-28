=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

INPUT: Two integers

OUTPUT: An Array

RULES
EXPLICIT REQUIREMENTS:
  - A method that takes two Integer arguments;
  - The return is an array of Integers of the same number of elements as the first argument;
  - The first element in the array is the second argument;
  - Subsequent elements are multiples of the first element;
  - The count argument will always be 0 or greater;
  - A count of 0 should produce an empty list
  
IMPLICIT REQUIREMENTS:
  - The second argument may be negative
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty array;
2.Insert the first element in the array as the second argument;
3.Create the second element as the second argument multiplied by 2;
4.Create the third element as the second argument multiplied by 3;
5.Repeat until the iteration reaches the value of the first argument;
6.Return the finished array.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop

# def sequence(count, num)
#   array = []
#   return array if count == 0
#   counter = 1
#   loop do
#     break if counter == count + 1
#     array << (counter * num)
#     counter += 1
#   end
#   array
# end

# solution 2 - Use an until loop

# def sequence(count, num)
#   array = []
#   return array if count == 0
#   counter = 1
#   until counter == count + 1 do
#     array << (counter * num)
#     counter += 1
#   end
#   array
# end

# solution 3 - use a range

def sequence(count, num)
  (1..count).map { |element| element * num }
end


# Print Tests

# Test Cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []