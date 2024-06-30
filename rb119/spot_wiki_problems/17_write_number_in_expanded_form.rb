=begin
17. Write Number in Expanded Form
(​https://www.codewars.com/kata/5842df8ccbd22792a4000245​)
6 kyu

Write Number in Expanded Form

You will be given a number and you will need to return it as a string in Expanded Form. For example:
expanded_form(12); # Should return '10 + 2' 
expanded_form(42); # Should return '40 + 2' 
expanded_form(70304); # Should return '70000 + 300 + 4' 

NOTE: All numbers will be whole numbers greater than 0.
If you liked this kata, check out part 2!! 

# UNDERSTAND THE PROBLEM
## INPUT: an integer
## OUTPUT: a string, 
## RULES
### Explicit requirements
  - all numbers will be Integers greater than zero
  - return should be a string showing each place value of the input Integer
### Implicit requirements:
  - 

# EXAMPLES
expanded_form(12); # Should return '10 + 2' 
expanded_form(42); # Should return '40 + 2' 
expanded_form(70304); # Should return '70000 + 300 + 4' # the 10s and 1000s places at zero are ignored in the final string

# DATA STRUCTURES

An array of the digits of the input Integer

# ALGORITHM

* CREATE an array of digits from the input number
    - input.digits.reverse
* COUNT the number of digits in the array
  - use Array#size
* CREATE a new array to capture multiplied digits
* CREATE a local variable to track place_value
  + this will be initialised at array.size - 1
  + this will be decremented by 1 on each iteration through the array of digits

* MOVE through the array of digits from left to right, from first to last
  + use #each
* MULTIPLY the current digit by its place value and SHOVEL it to the multiplied_digits array UNLESS the digit is zero
  + multiplication is digit * (10**place_value)
    - multiplied_digits << digit * (10**place_value
* DECREMENT the place value variable by 1
  + this will mean that for the last digit, place value is 0

* STOP moving through the array at the last digit
* JOIN the mulitiplied array into a string
  + the Array#join method with the right separator will do this and transform the integers into strings
    - multiplied_digits.join(" + ")
* RETURN the new string

=end

require 'pry'
require 'pry-byebug'

def expanded_form(integer)
  array_of_digits = integer.digits.reverse
  multiplied_digits = []
  place_value = array_of_digits.size - 1
  
  array_of_digits.each do |digit|
    unless digit == 0
      multiplied_digits << (digit * (10**place_value))
    end
    place_value -= 1
    # binding.pry
  end
  
  multiplied_digits.join(" + ")
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'