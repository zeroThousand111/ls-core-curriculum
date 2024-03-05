=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

INPUT: two integers, starting number and ending number

OUTPUT: print all numbers in the range with replacement 'fizz', 'buzz' and 'fizzbuzz'

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  - the numbers in the list can be numeric strings, not necessarily integers
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.

TWO different strategies

STRATEGY A - Create a list of numbers in the range first, substitute those numbers divisible by 3, by 5 and by 3 & 5, then output the list

1.CREATE the array of numbers
    i. array = []
    ii. num1.upto(num2) { |num| array << num }
2.EXAMINE each number to see if it is divisible by 3, 5 or both
3.REPLACE those numbers with strings, as appropriate
4.OUTPUT the list

STRATEGY B - Iterate through the range of numbers and output as you go, with replacements as required


1.
  a.
    i.
2.
  a.
    i.
3.
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

# solution 1 - STRATEGY A using #map to change the values

def fizzbuzz(num1, num2)
  array = []
  num1.upto(num2) { |num| array << num }
  
  filtered_array = array.map do |num|
                     if num % 3 == 0 && num % 5 == 0
                       "FizzBuzz"
                     elsif num % 5 == 0
                       "Buzz"
                     elsif num % 3 == 0
                       "Fizz"
                     else
                       num
                     end
                   end.join(', ')
  puts filtered_array
end


# -------------------

# solution 2 - STRATEGY B using #upto to generate the range

# def fizzbuzz(num1, num2)
#   num1.upto(num2) do |num|
#     if num % 3 == 0 && num % 5 == 0
#       puts "FizzBuzz"
#     elsif num % 5 == 0
#       puts "Buzz"
#     elsif num % 3 == 0
#       puts "Fizz"
#     else
#     puts  num
#     end
#   end
# end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests


# Test Cases
p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz