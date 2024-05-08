=begin
# Problem
Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

HINT:
Here is a link to some pseudocode and a description of how merge sort works in more detail. https://www.tutorialspoint.com/data_structures_algorithms/merge_sort_algorithm.htm#how_merge_sort_works

The website has this high-level algorithm:
Step 1: If it is only one element in the list, consider it already 
sorted, so return.
Step 2: Divide the list recursively into two halves until it can no  
more be divided.
Step 3: Merge the smaller lists into new list in sorted order.

It also includes this psuedocode:

procedure mergesort( var a as array )
   if ( n == 1 ) return a
      var l1 as array = a[0] ... a[n/2]
      var l2 as array = a[n/2+1] ... a[n]
      l1 = mergesort( l1 )
      l2 = mergesort( l2 )
      return merge( l1, l2 )
end procedure
procedure merge( var a as array, var b as array )
   var c as array
   while ( a and b have elements )
      if ( a[0] > b[0] )
         add b[0] to the end of c
         remove b[0] from b
      else
         add a[0] to the end of c
         remove a[0] from a
      end if
   end while
   while ( a has elements )
      add a[0] to the end of c
      remove a[0] from a
   end while
   while ( b has elements )
      add b[0] to the end of c
      remove b[0] from b
   end while
   return c
end procedure


Feel free to use the merge method you wrote in the previous exercise.

## Input: An array of objects, all of the same data type, either all integers or all strings
## Output: An array containing the elements of the calling object, sorted in order
## Rules:
### Explicit requirements
  - 
  -
### Implicit requirements
  - Sorting, means reordering in ascending alphabetical or numerical order, depending upon the data type
  -
  
  
# Examples/Test Cases

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# Data Structures

# Algorithm
* STEP
  + approach
    - procedure

=end

# Code
require 'pry'
require 'pry-byebug'


# solution to merge_sorted_lists previous problem

def merge(array1, array2)
  result = []
  index1 = 0
  index2 = 0
  
  loop do
    if array1[index1] == nil
      result << array2[index2]
      index2 += 1
    elsif array2[index2] == nil
      result << array1[index1]
      index1 += 1 
    elsif array1[index1] < array2[index2]
      result << array1[index1]
      index1 += 1
    elsif array1[index1] > array2[index2]
      result << array2[index2]
      index2 += 1
    elsif array1[index1] == array2[index2]
      result << array1[index1]
      result << array2[index2]
      index1 += 1
      index2 += 1
    end
    
    break if array1[index1] == nil && array2[index2] == nil
  end
  
  result
end

# solution to this problem

def halve(array)
    index = (size / 2) - 1
    [ [array[0..index]], [array[(index + 1)..-1]] ]
end

def merge_sort(array)
  # Step 1: If it is only one element in the list, consider it already sorted, so return.
  return array if array.size == 1
  
  # Step 2: Divide the list recursively into two halves until it can no more be divided.
  size = array.size
  until size == 1 do
    index = (size / 2) - 1
    array = [array[0..index]], [array[(index + 1)..-1]]
    size = size / 2
  end
  
  # Step 3: Merge the smaller lists into new list in sorted order.
  
  merge(subarray1, subarray2) # make this recursive. how?!
  
end


# ---

# print tests



# truth tests
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]