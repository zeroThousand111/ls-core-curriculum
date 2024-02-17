=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - Assume input is an Integer > 1
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

ALGORITHM 1 - Create a list of numbers, select those that are multiples and then sum this selected list

1.CREATE a list of numbers from 1 to input number
  a.
    i. (1...n).to_a
2.SELECT those numbers in the list that are divisble by 3 and 5
  a.Array#select
    i.n % 3 == 0 || n % 5 == 0
3.SUM the numbers in the selected array
  a.Array#sum
    i.selection.sum
    
ALGORITHM 2 - Create variable sum, then increment it to n, testing for multiples each time and add to a list, then sum the list
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

# solution 1 - create an array then select and sum

# def multisum(num)
#   array = (1..num).to_a
#   selection = array.select do |n|
#                 n % 3 == 0 || n % 5 == 0
#               end
#   selection.sum
# end

# -------------------

# solution 2 - solution 1 refectored to be more smart ass

# def multisum(num)
#   (1..num).to_a.select { |n| n % 3 == 0 || n % 5 == 0 }.sum
# end

# -------------------

# solution 3 - Algorithm 2 using simple loop

def multisum(num)
  sum = 0
  counter = 1
  
  loop do
    sum += counter if counter % 3 == 0 || counter % 5 == 0
    counter += 1
    break if counter > num
  end
  
  sum
end

# -------------------

# solution 4 - Using #upto

def multisum(num)
  sum = 0
  
  1.upto(num) do |i|
    sum += i if i % 3 == 0 || i % 5 == 0
  end
  
  sum
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168