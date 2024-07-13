=begin
37. Multiples of 3 or 5
(​https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby​)
6 kyu

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once. 

# PROBLEM

## INPUT: an integer
## OUTPUT: an integer
## RULES
### Explicit requirements:
  - find all the multiples of 3 and 5 that are less than the input Integer
  - sum those multiples and return the sum
  - if a number is a multiple of both 3 and 5, count it only once
### Implicit requirements:
  - test cases range from 10 to 200
  - range of values being searched is zero up to 1 less than input integer
  
# DATA STRUCTURES
Intemediate: an array of multiples

# ALGORITHM
## HIGH LEVEL
1. Find multiples of 3 and 5 from all numbers less than input integer
2. Sum and return those multiples

1. Find multiples of 3 and 5 from all numbers less than input integer
* CREATE an empty array of multiples
* MOVE through a range of Integers from 3 upto 1 less than input integer
  + use #upto
    - 3.upto(input - 1) do |num|
* DETERMINE if current num is a multiple of 3 or 5
  + use modulo operator
    - num % 3 == 0 || num % 5 == 0
* ACT upon the above determination
  + IF the current num is a multiple, SHOVEL it to the array of multiples
    - array_of_multiples << num if num % 3 == 0 || num % 5 == 0
2. Sum and return those multiples
* SUM the multiples
  + use #sum

=end

def solution(input_integer)
  array_of_multiples = []
  3.upto(input_integer - 1) do |num|
    array_of_multiples << num if num % 3 == 0 || num % 5 == 0
  end
  array_of_multiples.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168