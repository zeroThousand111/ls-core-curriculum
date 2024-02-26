=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - You may not use Array#reverse or Array#reverse!
  - Can't use solution to previous problem
  - Return is a NEW array
  - Reverse order
  
IMPLICIT REQUIREMENTS:
  - One element lists are allowed
  - Empty lists are allowed
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Arrays!
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE a new array
  a.
    i.new_array = []
2.TAKE the first element of the input array and add it to the new array
  a.
    i.new_array << input_array[0] OR
    ii.new_array.push(input_array[0])
3.REPEAT for each element of input array
  a.Use a simple loop and counter OR
  b.Use a FOR loop
  c.Use an UNTIL loop
    i.
4.CHECK when finished for every element of the input array
  a.When counter == input_array.size
    i.
5.Return new array
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using a simple loop 

def reverse(input_array)
  new_array = []
  return new_array if input_array.empty?
  index = 0
  loop do 
    new_array.unshift(input_array[index])
    index += 1
    break if index == input_array.size
  end
  
  new_array
end

# -------------------

# solution 2 - using a FOR loop - how much neater?!

def reverse(input_array)
  new_array = []
  return new_array if input_array.empty?
  
  for index in input_array do
    new_array.unshift(index)
  end

  new_array
end

# -------------------

# solution 3 - using #each

def reverse(input_array)
  new_array = []
  return new_array if input_array.empty?
  
  input_array.each do |element|
    new_array.unshift(element)
  end

  new_array
end

# -------------------

# solution 4 - Official LS solution

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true