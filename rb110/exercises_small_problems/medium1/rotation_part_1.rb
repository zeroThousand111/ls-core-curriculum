=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

INPUT: An Array

OUTPUT: A NEW Array

RULES
EXPLICIT REQUIREMENTS:
  - A method;
  - Return is an array with the first element of the input_array at the end of the output_array;
  - Return is a NEW array - the original array should not be modified;
  - Do not use the method Array#rotate or Array#rotate!
  
IMPLICIT REQUIREMENTS:
  - One element arrays are allowed;
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

STRATEGY A: BUILD A NEW ARRAY IN TWO CHUNKS
1. Create output_array [];
2. Take the elements of input_array in two chunks:
  a. Elements of input_array at indices 1 to -1 become elements in sub-array at position index 0in output_array
  b. Element index 0 of input_array becomes element -1 in output_array
3. Flatten output_array to remove sub-array;
4. Return output_array

STRATEGY B: PROGRAMATICALLY BUILD A NEW ARRAY FROM INPUT ARRAY
1. Create output_array [];
2. Iterate through elements of input_array:
   a. Start with element at index 1, shovel it to output_array
   b. Continue until all elements of input_array from index 1 to -1
3. Then shovel element at index 0 to end of output_array
4. Return output_array

STRATEGY C: CREATE A COPY OF INPUT ARRAY AND THEN MUTATE IT

1. Create output_array [];
2. Iterate through input_array and shovel each element onto output_array;
3. 
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Strategy A: My quick and dirty method using #insert and #flatten

# def rotate_array(input_array)
#   output_array = []
#   output_array.insert(0, input_array[1, (input_array.size - 1)])
#   output_array.insert(-1, input_array[0])
#   output_array.flatten
# end

# -------------------

# solution 2 - Strategy B: using a simple loop 

# def rotate_array(input_array)
#   output_array = []
  
#   index = 1
#   # programatically shovel elements at indices 1 to -1 into output_array
#   loop do
#     break if index == input_array.size
#     output_array << input_array[index]
#     index += 1
#   end
  
#   # shovel on element at index 0 of input_array onto end of output_array
#   output_array << input_array[0]
#   output_array
# end

# -------------------

# solution 3 - Strategy C: using #each

# def rotate_array(input_array)
#   output_array = []
#   # create copy of input_array
#   input_array.each { |e| output_array << e }
  
#   # mutate copy by #shift and #insert
#   output_array.shift
#   output_array.insert(-1, input_array[0])
#   # return 
#   output_array
# end

# -------------------

# solution 4 - official LS solution - so simple!

def rotate_array(array)
  array[1..-1] + [array[0]]
end

# -------------------

# Print Tests
p rotate_array(['a', 'b', 'c']) #['b', 'c', 'a']

# Test Cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true