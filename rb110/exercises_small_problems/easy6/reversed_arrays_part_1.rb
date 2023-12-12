=begin
Problem

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Test cases:

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

Input:  Array
Output: SAME array, but mutated
Interim:
Rules:
Explicit:
  - Method must reverse the elements of the array in place;
  - Method MUST mutate the argument array passed to the method, ;
  - 
Implied:
  - Method cannot simply return a new array;
  - 
Data Structures: Arrays
Algorithm

1. Create counter starting at 0;
2. 
  a. Store value of last element in a temp variable;
  b. Delete last element;
  c. Push that element to nth position in the array, where n = counter;
3. Loop through 2a-c until the counter is array length minus 1
4. Return mutated array
=end

# solution 1 - A Basic Loop

def reverse!(array)
  counter = 0
  
  return array if array.empty?
  
  loop do
    temp = array[-1]
    array.delete_at(-1)
    array.insert(counter, temp)
    
    break if counter == array.length - 1 
    counter += 1
  end
  array
end

# solution 2 - official LS solution

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

# test cases
list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true