=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

INPUT: An Array of Integers

OUTPUT: An Array of Integers, based on the input

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return should be the input but only those index numbers that are odd
  -
  
IMPLICIT REQUIREMENTS:
  - Empty lists are allowed
  - Non-Integers are also allowed
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Create an empty new Array;
2.Iterate through the input Array;
  a.Find a way of noting which elements are in odd indexes;
  b.Add the elements at the odd-indexes to the new Array;
3.Return the new Array.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - using a simple loop

# def oddities(input_array)
#   output_array = []
  
#   counter = 0
#   loop do
#     break if counter == input_array.size
#     output_array << input_array[counter] if counter % 2 == 0
#     counter += 1
#   end
  
#   output_array
# end

# -------------------

# solution 2 - using Array#each_with_index

# def oddities(input_array)
#   output_array = []
  
#   input_array.each_with_index do |element, index|
#     output_array << element if index % 2 == 0
#   end
  
#   output_array
# end

# -------------------

# solution 3 - using Array#select

# def oddities(input_array)
#   input_array.select.with_index { |element, index| index % 2 == 0 }
# end

# -------------------

# solution 4 - using Array#each_with_object (but not better than solution 2)

# def oddities(input_array)
#   input_array.each_with_object([]).with_index do |(element, array), index|
#     array << element if index % 2 == 0
#   end
# end

# -------------------

# solution 5 - using a while loop and += 2

def oddities(input_array)
  output_array = []
  counter = 0
  
  while counter < input_array.size
    output_array << input_array[counter]
    counter += 2
  end
  output_array
end

# -------------------

# Print Tests
p oddities([2, 3, 4, 5, 6]) #[2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) #[1, 3, 5]
p oddities(['abc', 'def']) # ['abc']
p oddities([]) #[]

# Test Cases
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]