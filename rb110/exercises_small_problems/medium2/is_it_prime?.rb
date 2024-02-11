=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

INPUT: a postive Integer

OUTPUT: a boolean

RULES
EXPLICIT REQUIREMENTS:
  - Ruby's Prime class is not allowed;
  - Return true if number is prime, false if not
  - Number will always be a positive integer
  
IMPLICIT REQUIREMENTS:
  - There are some very large numbers as test cases, so performance may need to be accounted for in the design of the method
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Perhaps an Array
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.RETURN false if number is 1
  a.
    i. Return false if test_num == 1
2.Take every number from 2 to number - 1 and create a range of numbers
  a.
    i. 2.upto(test_num - 1) {block}
3.Divide the test number by every number in the range
  a.
    i. 
4.RETURN false if the modulo value is 0
  a.
    i.return false if test_num % num == 0
5.RETURN true if the test number does not divide equally with  any number in the range
  a.
    i.true
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using #upto

def is_prime(test_num)
  return false if test_num == 1
  2.upto(test_num - 1) do |num|
    return false if test_num % num == 0
  end
  true
end

# -------------------

# solution 2 - Using a simple loop

# def is_prime(test_num)
#   return false if test_num == 1
#   return true if test_num == 2
#   num = test_num - 1
#   loop do 
#     return false if test_num % num == 0
#     num -= 1
#     break if num <= 1
#   end
  
#   true
# end

# -------------------

# solution 3 - using #downto

# def is_prime(test_num)
#   return false if test_num == 1
#   (test_num - 1).downto(2) do |num|
#     return false if test_num % num == 0
#   end
#   true
# end

# -------------------

# solution 4 - official LS solution

# def is_prime(number)
#   return false if number == 1

#   (2..(number - 1)).each do |divisor|
#     if number % divisor == 0
#       return false
#     end
#   end

#   return true
# end

# -------------------

# solution 5 -Official LS faster solution

# def is_prime(number)
#   return false if number == 1

#   (2..Math.sqrt(number)).each do |divisor|
#     if number % divisor == 0
#       return false
#     end
#   end

#   return true
# end

# -------------------

# Print Tests

# Test Cases
puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true