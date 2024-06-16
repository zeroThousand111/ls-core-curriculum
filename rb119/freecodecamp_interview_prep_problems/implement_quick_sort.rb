=begin
Here we will move on to an intermediate sorting algorithm: quick sort. Quicsort is an efficient, recursive divide-and-conquer approach to sorting aarray. In this method, a pivot value is chosen in the original array. Tharray is then partitioned into two subarrays of values less than and greatethan the pivot value. We then combine the result of recursively calling thquick sort algorithm on both sub-arrays. This continues until the base case oan empty or single-item array is reached, which we return. The unwinding othe recursive calls return us the sorted array.

Quick sort is a very efficient sorting method, providing _O(nlog)_ performance on average. It is also relatively easy to implement. Thesattributes make it a popular and useful sorting method.

**Instructions:** Write a function `quickSort` which takes an array of integers as input and returns an array of these integers in sorted order from least to greatest. While the choice of the pivot value is important, any pivot will do for our purposes here. For simplicity, the first or last element could be used.

Once again, more explanation is needed and Wikipedia has a helpful page, including a section on [the actual algorithm for quick sort](https://en.wikipedia.org/wiki/Quicksort#Algorithm).

# UNDERSTAND THE PROBLEM
## INPUT: an array of Integers
## OUTPUT: the same array of Integers, with reordered elements in order of ascending value
## RULES
### Explicit requirements:
  - quick_sort should be a method
  - quick_sort should return a sorted array (least to greatest)
  - quick_sort([1,4,2,8,345,123,43,32,5643,63,123,43,2,55,1,234,92]) should return   an array that is unchanged except for order
  - quick_sort should not use the built-in `.sort()` method
  - 
  - 

### Implicit requirements
  - the method will use recursion
  - the method will use repeated partitioning of the array and subarrays into two arrays that are divided being greater or lesser than a random pivot value
  
# EXAMPLES / TESTS CASES

N.B. Write my own simple test cases

# DATA STRUCTURE
An array of integers
Probably subarrays of that array for the partioning algorithm

# ALGORITHM
* RETURN array if array has zero or 1 element i.e. < 2 elements
Below is a recursive method, applied to the input array and then all subarrays thereafter:
* CHOOSE a random element in the array and store its index
  + CREATE a local variable
    - pivot_index = rand(array.size - 1); OR
    - pivot_index = array.last OR
    - pivot_index = array.first
* PARTITION the elements of the array/subarray according to whether or not their value is greater or lesser than the value of the random pivot element
  + use Array#partition to partition into two subarrays
  + [[truthy return], [falsy return]]
  + Therefore the condition in the block passed to #partition must be < (or <=) to the value of the pivot element, so that smaller elements are put into the first subarray returned by #partition
    - array.partition { |num| num < array[pivot_index] }
* JOIN the two subarrays back togther again
  + is this step at each iteration, or just once at the end?
  + use #flatten to take the two 
* REPEAT recursively UNTIL ??? WHEN??
* STOP recursion


# QUICK START - I abandoned this on 16/06/24 not knowing how I could stop the recursion

=end

def quick_sort(array)
  return array if array.size < 2
  
  # one-off partition test
  pivot_index = rand(array.size - 1)
  array = array.partition { |num| num <= array[pivot_index] }
  
  # recursive partition
  
  array.flatten
end


p quick_sort([]) == []     # test for no elements in array
p quick_sort([9]) == [9]   # test for one element in the array

p quick_sort([9, 1, 9, 1, 9, 1]) #== [9]# test for initial partion and flatten
p quick_sort([9, 1, 2, 3, 8, 6, 7, 5, 4]) #== [9]# test for initial partion and flatten