=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

# UNDERSTAND THE PROBLEM

## Input: An array
## Output: A new array, where the first element is now the last
## Rules
### Explicit requirements:
  - A method
  - Return a new array; don't mutate the calling object array
  - Returned array has the first element of the calling object moved to the end of the array
  - Don't use Array#rotate or #rotate!

### Implicit requirements:
  - Objects within the input array can be strings, or integers, or perhaps any kind of object
  - Arrays of just one object are allowed
  - 
  
# TEST CASES / EXAMPLES
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# DATA STRUCTURES
Arrays

# ALGORITHM

* create a new array
    - output_array = []
    
* MOVE through the input array, starting at index 1 (not 0)
* SHOVEL each element of the input array into the output array
* Then SHOVEL the first element of the input array into the output array
* RETURN the output array
=end

def rotate_array(input_array)
  output_array = []
  1.upto(input_array.size - 1) do |index|
    output_array << input_array[index]
  end
  output_array << input_array[0]
end

# ---

def rotate_array(input_array)
  output_array = []
  1.upto(input_array.size - 1) { |index| output_array << input_array[index] }
  output_array << input_array[0]
end

# ---

def rotate_array(input_array)
  output_array = []
  (1...input_array.size).each { |index| output_array << input_array[index] }
  output_array << input_array[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true