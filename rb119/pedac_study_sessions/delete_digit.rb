=begin

Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

# UNDERSTAND THE PROBLEM
## INPUT: a positive integer
## OUTPUT: a positive integer (different)
## RULE
### Explict requirements:
- find the "maximal" number
- delete exactly one digit of the given number

### Implicit requirements:
- "digit" means one unit of the number
- maximal probably means number with the highest value

# EXAMPLES

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101 # why not 110? because only deleting
delete_digit(10) == 1

# DATA STRUCTURES
INPUT: an Integer
OUTPUT: an Integer
INTERMEDIATE:
- an array of digits from the input number?
- an array of all possible numbers, where one digit has been removed from the input number

# ALGORITHM
## HIGH-LEVEL
1. Create a list of n copies of the input number as strings
2. Remove a digit/character from each of the number copies, starting at index 0 and moving up one index each time
3. Find which of those numbers has the maximum value and return it

1. Create a list of n copies of the input number as strings
* CREATE an empty array of all numbers
* ITERATE the number of times there are digits in the number
  + use #times
* On each iteration, SHOVEL a string version of the number to array of all numbers
    - array << input_num.to_s
2. Remove a digit/character from each of the number copies, starting at index 0 and moving up one index each time
* MOVE through the array of nums, one string at a time, tracking index number
  + use #each_with_index
* DELETE the index-th character from each string in the array
    - string[index] = ""
* TRANSFORM the strings in the list to Integers
  + use #to_i
3. Find which of those numbers has the maximum value and return it
* Find the max value
  + use #max
=end

def create_array(num)
  array = []
  num.digits.size.times do |_|
    array << num.to_s
  end
  array
end

def modify_array(array)
  array.each_with_index do |string, index|
    string[index] = ""
  end
  # array.map(&:to_i)
  array.map do |string|
    string.to_i
  end
end

def delete_digit(num)
  array_of_nums = create_array(num)
  array_of_nums = modify_array(array_of_nums)
  array_of_nums.max
end

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1