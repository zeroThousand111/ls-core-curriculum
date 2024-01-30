=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

INPUT:  An Integer

OUTPUT: A series of lines of strings

RULES
EXPLICIT REQUIREMENTS:
  - n is always an odd integer
  -
  -
  
IMPLICIT REQUIREMENTS:
  - the diamond will always be an odd number of lines tall
  - the diamond will always be an odd number of asterisks wide at the widest line
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

diamond(1)

*

diamond(3)

 *
***
 *
 
 diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings.
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Calculate the build_number (the number of lines above and below the central line and the number of white spaces) x = (n / 2) - 0.5 or x = n / 2 (if just an integer)
2. Print top half of diamond
  a. Create decrementing_counter = build_num
  b. Create incrementing_counter = 1
  c. Loop - Print build_num number of lines according to pattern: 
  (" " * decrementing_counter) + ("*" * incrementing_counter)
  d. Decrement decrementing counter by 1
  e. Increment incrementing counter by 2
  f. Break when decrementing counter == 0
3. Print central line: n number of asterisks
4. Print bottom half of diamond
  a. Create incrementing_counter = 1
  b. Create decrementing_counter = build_number
  c. Loop - Print build_num of lines according to pattern:
  (" " * incrementing_counter) + ("*" * decrementing_counter)
  d. Decrement decrementing counter by 2
  e. Increment incrementing counter by 1
  f. Break when decrementing counter == 1
5.There is no number 5...
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using simple loops and two helper methods 

def top_half(n)
  dec_counter = n / 2
  inc_counter = 1
  loop do
    puts " " * dec_counter + "*" * inc_counter
    break if dec_counter <= 1
    inc_counter += 2
    dec_counter -= 1
  end
end

def bottom_half(n)
  inc_counter = 1
  dec_counter = n - 2
  loop do
    puts " " * inc_counter + "*" * dec_counter
    break if dec_counter <= 1
    inc_counter += 1
    dec_counter -= 2
  end
end

def diamond(n)
  top_half(n) unless n == 1
  puts "*" * n
  bottom_half(n) unless n == 1
end

# -------------------

# solution 2 - official LS solution



# -------------------

# Print Tests
diamond(1)
diamond(3)
diamond(5)
diamond(9)

# Test Cases