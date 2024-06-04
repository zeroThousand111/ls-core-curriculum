=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# UNDERSTAND THE PROBLEM

## Input: an array of integers
## Output: a (NEW?) array of integers sorted according to the alphabetical order of their alphabetical equivalent strings.
## Rules
### Explicit requirements:
  - The input array will contain integers of value between zero and 19
  -

### Implicit requirements:
  - There are no duplicate integers in the test case
  - 
  
## REFRAME THE PROBLEM

- From an input array of integers, return a new array of those same integers, sorted in the order that their alphabetical equivalent strings would appear in alphabetical order.


# TEST CASES/EXAMPLES

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# DATA STRUCTURES
Arrays for input and output, and maybe intermediary
A Hash to link string with integer value

# ALGORITHM

* CREATE a hash of key-value pairs linking integers zero to 19 with their alphabetic equivalents
  + e.g. {1 => "one", 2 => "two"}
    - HASH = {contents here}
* CREATE and RETURN a new array of integers SORTED according to the 
  + use Enumerable#sort_by with block that uses the HASH
    - input_array.sort_by { |num| HASH[num] }
=end

HASH = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

def alphabetic_number_sort(input_array)
  input_array.sort_by { |num| HASH[num] }
end

p alphabetic_number_sort([2, 1, 3])

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]