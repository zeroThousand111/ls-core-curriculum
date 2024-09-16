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
# UNDERSTAND
## INPUT: an array of integers
## OUTPUT
## RULES
### EXPLICIT REQUIREMENTS
  - return 0 if array is empty or contains only one value
  - return the number of pairs of integers
  - size of array will vary
  - 

### IMPLICIT REQUIREMENTS
  - the integers are all positive or zero, not negative
  - empy array is allowed
  - size of array can be odd or even number

# DATA STRUCTURES
input: an array of integers
output: an Integer
intermediate:
  - 
  a tally hash
# ALGORITHM
## HIGH-LEVEL APPROACH 1
1. Create a tally hash of Integers and their frequencies
2. Create a pairs local variable
3. Move through the tally hash, Count the number of pairs
* Count the values of 2 or more, rounded down to the next lower even number
4. Increment pairs variable for each pair
5. RETURN the pairs value

## HIGH-LEVEL APPROACH 2
1. Create a reference array of unique integers from the input array
2. Move through the reference array from first element to last
3. Create a new local variable pairs
4. COUNT the number of incidences of current number
5. INCREMENT pairs variable by
6. STOP moving through the reference array
7. RETURN the pairs value

## DETAIL
1. Create a tally hash of Integers and their frequencies
  + use #tally
2. Create a pairs local variable
3. Move through the tally hash, Count the number of pairs
  + use #each to move
  + use 
* Count the values of 2 or more, rounded down to the next lower even number
4. Increment pairs variable for each pair
5. RETURN the pairs value

=end

def pairs(array)
  output = 0
  tally_hash = array.tally
  tally_hash.each do |num, freq|
    if freq >= 2
        if freq.even?
          output += (freq / 2)
        else
          output += ((freq - 1) / 2)
        end
    end
  end
  output
end
     
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4 
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0