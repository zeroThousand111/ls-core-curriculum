=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

# UNDERSTAND THE PROBLEM
## INPUT: an array of Integers
## OUTPUT: an array of Integers, representing how many numbers of the array are smaller than the Integer at that index of the input array
## RULES
### Explicit requirements:
  - Return an array of counts
  - Ignore duplicate values
### Implicit requirements:
  - 

# EXAMPLES

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

The above tests should each print true.

# DATA STRUCTURES
Arrays of integers

# ALGORITHM

* CREATE an output array of counts
    - array_of_counts = []
* CREATE an array of unique values
    - unique_values_array = array.uniq
--- start of outer iterator
* MOVE through the array of Integers, from first element to the last
  + where appropriate, use an iterator rather than a loop
  + use #each
    - array.each
* For the current Integer, DETERMINE how many numbers in the input array have a smaller value

--- start of inner iterator
* CREATE a local variable to track tally of values smaller than current
* MOVE through the unique value array
* DETERMINE if unique value is less than current value
* ACT upon the determination
  + IF the unique value is smaller than current value, increment tally by 1
    -  if 
  + ELSE move on and do nothing
--- end of inner iterator

* SHOVEL tally on to end of array of counts
--- stop outer iterator

* RETURN array_of_counts

=end

def smaller_numbers_than_current(array)
  array_of_counts = []
  unique_values_array = array.uniq
  
  array.each do |num|
    tally = 0
    unique_values_array.each do |uniq|
      tally += 1 if uniq < num
    end
    array_of_counts << tally
  end
  array_of_counts
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result