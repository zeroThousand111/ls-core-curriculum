=begin
Problem 15
Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

Examples

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
The above tests should each print true.


# UNDERSTAND THE PROBLEM
## INPUT: a string of numeric characters
## OUTPUT: the greatest possible sum of the Integer equivalents of the digits
## RULES
### EXPLICIT REQUIREMENTS:
  - string argument will always have more than 4 digits
  - return the largest sum of a substring of 4 CONSECUTIVE digits
  - 
### IMPLICIT REQUIREMENTS
 - test cases show the largest 4 to be in sequence/consecutive

# EXAMPLES
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

# DATA STRUCTURES
input: a string
output: an Integer
intermediate: an array of substrings containing 4 consecutive digits OR an array of the sums of each of those substrings

# ALGORITHM
## HIGH-LEVEL
1. CREATE or SELECT each 4-digit substring from the input string
2. CALCULATE the product of those four digits for each substring and STORE in an array
3. RETURN the largest value from the array of sums

## DETAIL
1. CREATE or SELECT each 4-digit substring from the input string
* CREATE an empty array to store
* SELECT each substring and SHOVEL to the empty array
  + use nested #upto iterators
  + or use #each_cons(4)
    - chars.each_cons(4) { |sub| p sub.to_i}
  + this will create an array of subarrays, each with 4 string chars
* TRANSFORM each numeric char into a digit
  + Use two nested #map invocations
2. CALCULATE the product of those four digits for each substring and STORE in an array
* TRANSFORM the subarrays of digits into the products of those digits 
  + use #map { |subarray| subarray.inject(&:*)
3. RETURN the largest value from the array of sums
* Find the largest value
  + use Array#max 
=end

def create_subarrays(string)
  array_of_digits = []
  string.chars.each_cons(4) do |subarray|
    array_of_digits << subarray
  end
  array_of_digits.map do |subarray|
    subarray.map do |char|
      char.to_i
    end
  end
end

def greatest_product(string)
  array_of_subarrays = create_subarrays(string)
  array_of_sums = array_of_subarrays.map {|subarray| subarray.inject(&:*) }
  array_of_sums.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6