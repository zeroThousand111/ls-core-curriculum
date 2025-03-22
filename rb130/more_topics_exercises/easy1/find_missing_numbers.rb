=begin
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

Examples:

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

I needed to PEDAC this.  Oh boy I was rusty on PEDAC.  RB119 was back in August 2024!

# PROBLEM
## Explicit requirements
 - return an array
 - array contains those numbers missing from the sorted input array
 - missing integers should be returned in numeric order

## Implicit requirements
 - the returned array is a new array

# TEST CASES
see above

# DATA STRUCTURES
 - An array of integers

# ALGORITHM
 - sort the input array into numeric order
 - create an empty output array
 - create start counter at lowest integer value in sorted input array
 - iterate from lowest integer value up to highest in sorted input array
   + use #lowest_value.upto(highest_value)
 - IF current counter value isn't included in the input array, shovel it to output array
 - stop iterating when the last value in the input array is reached
 - return output array

=end

# My solution

def missing(input_array)
  output_array = []
  sorted_array = input_array.sort
  sorted_array[0].upto(sorted_array[-1]) do |counter|
    output_array << counter if !sorted_array.include?(counter)
  end
  output_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# LS Solution

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

=begin
Discussion
This problem boils down to finding the missing integers between each pair of numbers in the original array. So, in the first example, we need all the integers between -3 and -2, then between -2 and 1, and finally, between 1 and 5.

Enumerable#each_cons is extremely handy when you need to iterate through consecutive, overlapping sequences. (Enumerable#each_slice, by contrast, iterates through consecutive, non-overlapping sequences.) Given the argument n, it takes every n consecutive elements from the subject collection, and iterates through each sequence of n consecutive items.

We use each_cons here for just such an operation, taking 2-number sequences from array. The block simply generates the list of numbers between each pair of numbers, and appends them to the result array.

Further Exploration
Can you find other ways to solve this problem? What methods might prove useful? Can you find a way to solve this without using a method that requires a block?
=end

# My Further Exploration

# I DID find a solution that doesn't use a block and it was way easier to visualise mentally than the LS solution!