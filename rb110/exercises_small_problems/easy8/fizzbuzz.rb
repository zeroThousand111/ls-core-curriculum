=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

INPUT: Two integer arguments

OUTPUT: Print integers and strings (or just numerical strings with word strings?)

RULES
EXPLICIT REQUIREMENTS:
  - A method that takes two arguments;
  - the first is the starting number, and the second is the ending number;
  - Print out all numbers from the starting number to the ending number;
  - if a number is divisible by 3, print "Fizz";
  - if a number is divisible by 5, print "Buzz";
  - if a number is divisible by 3 && 5, print "FizzBuzz";
  
IMPLICIT REQUIREMENTS:
  -
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

1. Generate numbers from A to B;
2. Iterate through each number;
  a. If number divisible by 3, print "Fizz"
  b. If number divisible by 5, print "Buzz"
  c. If number divisible by both 3 & 5, print "FizzBuzz"
  d. Else print number
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - use #upto

# def fizzbuzz(min, max)
#   min.upto(max).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#       puts "FizzBuzz"
#     elsif num % 3 == 0
#       puts "Fizz"
#     elsif num % 5 == 0
#       puts "Buzz"
#     else
#       puts num
#     end
#   end
# end

# solution 2 - separate number generation then conditional output

def output(num)
  if num % 3 == 0 && num % 5 == 0
    puts "FizzBuzz"
  elsif num % 3 == 0
    puts "Fizz"
  elsif num % 5 == 0
    puts "Buzz"
  else
    puts num
  end
end

def fizzbuzz(start, finish)
  list = start.upto(finish)
  list.each { |num| output(num) }
end

# Print Tests
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Test Cases
