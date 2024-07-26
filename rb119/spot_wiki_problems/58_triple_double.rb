=begin
58. Triple trouble
(​https://www.codewars.com/kata/55d5434f269c0c3f1b000058​)
6 kyu

Write a function
triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
If this isn't the case, return 0

# PROBLEM
## INPUT: two integers
## OUTPUT: an integer, either 1 or 0
## RULES
### Explicit requirements:
  - two number arguments, presumably Integers?
  - return 1 IF there is 
    - a) a "triple" of a number in num1; AND
    - b) a "double" of a number in num2
### Implicit requirements:
  - "triple" means the same number digit three times in sequence in the integer
  - "double" means the same number digit two times in sequence
  - length of num1 and num2 is not the same necessarily
  
Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2 

# DATA STRUCTURE
## INPUT: two integer arguments
## OUTPUT: an integer, either 1 or 0
## INTERMEDIATE: maybe not needed

# ALGORITHM
1. is there a triple digit in num1?
2. is there a double digit in num2?
3. RETURN 1 if the answer to both is yes, 0 if not

1. is there a triple digit in num1?
* MOVE through the digits of num1 from first to last
* CREATE an array of subdigits containing only 3 digits
* MOVE through each subdigit from first to last
* TEST if each subdigit (of 3 digits) is the same number
  + create an array of digits
  + use #all? (digit == subdigit[0])
* RETURN true if one subdigit does contain all the same number
2. is there a double digit in num2?
+ repeat but for subdigits of length 2
3. RETURN 1 if the answer to both is yes, 0 if not

=end

require 'pry'
require 'pry-byebug'

def test_subarray(array)
  array.any? do |subarray|
    subarray.all? do |digit|
      subarray[0] == digit
    end
  end
end

def triple_double(num1, num2)
  triples = []
  doubles = []
  num1.digits.reverse.each_cons(3) { |subarray| triples << subarray}
  num2.digits.reverse.each_cons(2) { |subarray| doubles << subarray}
  return 1 if test_subarray(triples) && test_subarray(doubles)
  0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1