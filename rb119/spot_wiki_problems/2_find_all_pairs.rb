=begin
Find all pairs
You are given array of integers, your task will be to count all pairs in that array and return their count. Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1,2,5,6,5,2] --> 2
...because there are 2 pairs: 2 and 5
[1,2,2,20,6,20,2,6,2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again) 


# UNDERSTAND THE PROBLEM
## INPUT: an array of Integers
## OUTPUT: an Integer, representing the number of pairs of Integers in the input array
## RULES
### EXPLICIT REQUIREMENTS
  - count all the pairs in the array, and return that count
  - when an array is empty or contains only one element, return 0
  - if there are multiple pairs of the same value, count each pair
### IMPLICIT REQUIREMENTS
  - will need to handle multiple sizes of input arrays
  
# EXAMPLES / TEST CASES
p pairs([1, 2, 5, 6, 5, 2]) == 2 (1 pair of 2s, 1 pair of 5s)
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4 (2 pairs of 2s, 1 pair of 6s, 1 pair of 20s)
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 (3 pairs of zeroes)
p pairs([1000, 1000]) == 1 (1 pair of 1000s)
p pairs([]) == 0 (empty array)
p pairs([54]) == 0 (just one element)

# DATA STRUCTURES
An array of Integers

# ALGORITHM

* CREATE a local variable to track count of pairs
    - count = 0
* CREATE a new array of unique Integers
  + use #uniq to create new array and SORT elements in ascending numerical order
    - unique_array = input_array.uniq.sort
* MOVE through the unique array from first element to last
  + use #each
* for each element MOVE through the input_array and count the frequencies
  + use #each
* DETERMINE if element is one of a pair
  + count the frequency that element appears in the input array
  + create local variable to track number of appearances
    - appearance = 0
  + use String#count, so need to TRANSFORM Integer to String first
  + IF frequency is 2 or greater, halve the frequency (round down) and increment the `count` variable by that number
  + using Integers will naturally round down the number of appearances i.e. 1 appearance (not a pair) will result in 0, 3 appearances will result in 1 pair
    - appearance += 1 if unique_num_string == num.to_s
* ACT upon the determination above
  + IF there is a pair, increment count variable by appearances / 2
    - count += (appearance / 2)
  + ELSE move on to next 

* RETURN count variable
=end

def pairs(input_array)
  count = 0
  unique_array = input_array.map(&:to_s).uniq.sort
  
  unique_array.each do |unique_num_string|
    appearance = 0
    input_array.each do |num|
      appearance += 1 if unique_num_string == num.to_s
    end
    count += (appearance / 2)
  end
  
  count
end
     
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4 
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0