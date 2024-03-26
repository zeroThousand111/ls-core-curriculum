=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
A prime number is a positive number that is evenly divisible only by itself and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to programmatically determine whether a number is prime without relying on any methods that already do that for you.

INPUT: a positive Integer

OUTPUT: a Boolean, true if input is a prime number

RULES
EXPLICIT REQUIREMENTS:
  - Ruby's Prime class is not permitted
  - Programatically determine whether or not input is prime
  -
  
IMPLICIT REQUIREMENTS:
  - Two numbers are very large, meaning performance may be an issue
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

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an array of numbers between 2 and (input - 1)
  a.
    i.
2.DETERMINE if input is divisible by any number in the array
  a.Check for divisibility
    i.input % array[0] = 0
  b.IF the number is divisible, return false (it's not prime)
3.RETURN true if no number in the array has caused a false return
  a.
    i.
4.
  a.
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - create an array of integers between 2 and (input - 1)

def is_prime(num)
  return false if num == 1
  array = (2...num).to_a
  
  array.each do |i|
    return false if num % i == 0
  end
  
  true
end

# -------------------

# solution 2 - using upto and a local variable - much faster than solution 1!

def is_prime(num)
  return false if num == 1
  
  2.upto(num - 1) do |i|
    return false if num % i == 0
  end
  
  true
end

# -------------------

# solution 3 - using the knowledge that possible divisors stop at the square root of the number - even faster than solution 2, because less numbers need to be checked!

def is_prime(num)
  return false if num == 1
  
  2.upto(Math.sqrt(num)) do |i|
    return false if num % i == 0
  end
  
  true
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

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