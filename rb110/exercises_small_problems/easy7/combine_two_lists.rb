=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

INPUT: An Array

OUTPUT: An Array

RULES
EXPLICIT REQUIREMENTS:
  - A method that takes two arguments that are Arrays;
  - Return is a NEW Array;
  - Assume both input Arrays are filled and have the same number of elements;
  
IMPLICIT REQUIREMENTS:
  - The two argument Arrays may not contain the same type of object;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty new array;
2.Populate the new array:
  a.Take the first element of the first array;
  b.Take the first element of the second array;
3.Repeat 2 until all elements have been added from both arrays; and
4.Return new array.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use a simple loop

# def interleave(array1, array2)
#   counter = 0
#   new_array = []
#   loop do
#     new_array << array1[counter]
#     new_array << array2[counter]
#     counter += 1
#     break if counter == array2.size
#   end
#   new_array
# end


# solution 2 - official LS solution

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# Print Test
p interleave([1, 2, 3], ['a', 'b', 'c']) # [1, 'a', 2, 'b', 3, 'c']



# Test Cases

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']