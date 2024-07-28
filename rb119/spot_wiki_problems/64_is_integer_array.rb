=begin
64. Is Integer Array?
(​https://www.codewars.com/kata/52a112d9488f506ae7000b95)
6 kyu

Write a function with the signature shown below:
def is_int_array(arr) true
end
returns true / True if every element in an array is an integer or a float with no decimals. returns true / True if array is empty.
returns false / False for every other input.

# UNDERSTAND THE PROBLEM
## INPUT: an array, maybe, with elements that may or may not be all integers
## OUTPUT: a boolean true or false
## RULES
### EXPLICIT REQUIREMENTS:
  - the method is called is_int_array
  - one argument
  - return true if all elements are Integers (or floats with no decimals)
### IMPLICIT REQUIREMENTS
  - I don't think floats with no decimals exist in Ruby, so assume they mean "are all elements integers?"
# EXAMPLES

NONE!

# DATA STRUCTURES
## INPUT: an array of elements
## OUTPUT: a boolean true or false
## INTERMEDIATE: I don't think is needed

# ALGORITHM
## HIGH-LEVEL
1. EVALUATE if the input is an array (return false if not)
2. Check that ALL elements of the array are integers, return true if yes, false if not

## DETAIL
* Check if the input is an array, return false if not
  + use #is_a?(Array)
* MOVE through the input array from teh first element to the last and check if every element satisfies a condition
  + use #all?
  + condition is #is_a?(Integer)
=end

def is_int_array(arr)
  return false unless arr.is_a?(Array)
  
  arr.all? do |element|
    element.is_a?(Integer)
  end
end

p is_int_array([1, 2, 3]) == true
p is_int_array([1.0, 2, 3]) == false
p is_int_array(["A", "b", 3]) == false