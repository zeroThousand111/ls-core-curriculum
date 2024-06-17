=begin
Binary search is an O(log(n)) efficiency algorithm for searching a sorted array to find an element. It operates using the following steps:

1. Find the middle value of a sorted array. If value == target return true (The value has been found and the search is complete).
2. If middle value < target, search right half of array in next compare.
3. If middle value > target, search left half of array in next compare.
4. If after searching the whole array the value is not present, return false (The array has been searched and the value is not in the array).

As you can see, you are successively halving an array, which gives you the log(n) efficiency. For this challenge, we want you to show your work - how you got to the target value... the path you took!

Write a function binarySearch that implements the binary search algorithm on an array, returning the path you took (each middle value comparison) to find the target in an array.

The function takes a sorted array of integers and a target value as input. It returns an array containing (in-order) the middle value you found at each halving of the original array until you found the target value. The target value should be the last element of the returned array. If the value is not found, return the string Value Not Found.

For example, binarySearch([1,2,3,4,5,6,7], 5) would return [4,6,5].

For this challenge, when halving, you MUST use Math.floor() when doing division: Math.floor(x/2). This will give a consistent, testable path.

Note: The following array will be used in tests:

const testArray = [
  0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22,
  23, 49, 70
];

# UNDERSTAND THE PROBLEM

## INPUT: a test array of integers, and a target integer
## OUTPUT: an array of integers, or a string
## RULES
### Explicit requirements
  - test_array contains Integers that are sorted in ascending order of value
  - when halving, you MUST use Math.floor() when doing division: Math.floor(x/2).  This is a JavaScript method.  Integer#floor may be an analagous ruby method.  Therefore must use #floor(n / 2)
### Implicit requirements
  - test_array contains 24 Integers, an even number
  - is the "middle" value, the mean value or the median index?  I'll assume it is the median index
  - Therefore middle index is array.size % 2 (Integer object rounds down when size is an even number)

# Examples / Test Cases

binary_search(testArray, 0) == [13, 5, 2, 0]
binary_search(testArray, 1) == [13, 5, 2, 0, 1]
binary_search(testArray, 2) == [13, 5, 2]
binary_search(testArray, 6) == "Value Not Found"
binary_search(testArray, 11) == [13, 5, 10, 11]
binary_search(testArray, 13) == [13]
binary_search(testArray, 70) == [13, 19, 22, 49, 70]

# DATA STRUCTURES
An array of Integers

# ALGORITHM
* CREATE an array of middle values to return at the end
--- LOOP BEGINS HERE
* REPEAT until size of subarray is 1
* LOCATE the MIDDLE value of the array
  + middle value is median index number
  + middle is at index (array.size - 1 / 2)
  + must use Integer#floor method or similar to get consistent halving of the array i.e. finding the median value of the current subarray
    - middle = subarray[((subarray.size - 1) / 2).floor]
* SHOVEL middle value onto array of middle values
* COMPARE middle value with target value
* STOP iterating if middle value == target value
* CREATE a subarray and go back to beginning of loop
  + IF target value is higher than middle value, then subarray is array[middle..-1]
  + IF target value is lower than middle value, then subarray is array[0..middle]
* STOP iterating when size of subarray is 1
--- LOOP STOPS HERE
* RETURN the array of middle values

=end

require 'pry'
require 'pry-byebug'

test_array = [ 0, 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 49, 70 ] # 24 elements.  Half will be at index 11 i.e. value 13 

def binary_search(array, target)
  array_of_middles = []
  subarray = array
  
  until subarray.size < 1
    middle_value = subarray[(subarray.size - 1) / 2]
    middle_index = (subarray.size - 1) / 2
    # binding.pry
    if middle_value == target
      array_of_middles << middle_value
      return array_of_middles
    elsif target < middle_value # search left of middle value
      array_of_middles << middle_value
      subarray = subarray[0...middle_index]
    elsif target > middle_value # search right of middle value
      array_of_middles << middle_value
      subarray = subarray[(middle_index + 1)..-1]
    end
    
  end
  "Value Not Found"
end


# Examples / Test Cases
p binary_search(test_array, 0) == [13, 5, 2, 0] 
p binary_search(test_array, 1) == [13, 5, 2, 0, 1]

p binary_search(test_array, 2)  == [13, 5, 2]
  # [ 0, 1, 2, 3, 4, *5*, 8, 9, 10, 11, 12]
  # [ 0, 1, *2*, 3, 4]
  
p binary_search(test_array, 6) == "Value Not Found"
p binary_search(test_array, 11) == [13, 5, 10, 11]
p binary_search(test_array, 13) == [13]
p binary_search(test_array, 70) == [13, 19, 22, 49, 70]