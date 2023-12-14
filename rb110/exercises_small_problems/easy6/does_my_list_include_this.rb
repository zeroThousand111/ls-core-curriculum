=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

INPUT: An array and a search argument

OUTPUT: A boolean

RULES
EXPLICIT REQUIREMENTS:
  - A method called include?;
  - May not use Ruby core library method Array#include?;
  - 
  
IMPLICIT REQUIREMENTS:
  - Array can be empty;
  - Search pattern can be integer or nil;
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

Solution 1 - Loop through the array

1.Loop or iterate through each element of the input array;
2.Create a new array with #select and expression in the block is the pattern.
3.Test if new array is not empty after looping through whole collection.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end


# solution 1 - loop through input array, place matches into new array and then test if new array is not empty
# def include?(array, search)
#   search_array = []
#   counter = 0
#   return false if array.empty?
  
#   loop do
#     search_array << array[counter] if array[counter] == search
#     counter += 1
#     break if counter == array.size
#   end
#   !search_array.empty?
# end

# solution 2 - iterate through input array, place matches into new array and then test if new array is not empty

# def include?(array, search)
#   search_array = []
#   return false if array.empty?
  
#   array.each do |element|
#     search_array << element if element == search
#   end
  
#   !search_array.empty?
# end

# solution 3 - use #select and then test if new array is not empty

# def include?(array, search)
#   search_array = array.select do |element|
#     element == search
#   end
  
#   !search_array.empty?
# end

# solution 4 - use #delete to remove any matches then check array size

# def include?(array, search)
#   original_size = array.size
#   array.delete(search)
#   array.size != original_size
# end


# solution 5 - use a method similar to Array#include? | Enumerable#any?

# def include?(array, search)
#   array.any?(search)
# end


# solution 6 - Count if pattern is present

# def include?(array, search)
#   array.count(search) >= 1 ? true : false
# end

# solution 7 - official LS solution

# def include?(array, value)
#   !!array.find_index(value)
# end

# solution 8 - another official LS solution

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

# Test Cases
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false