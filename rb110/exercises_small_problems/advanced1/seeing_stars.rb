=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

INPUT: An Integer

OUTPUT: A grid of characters / A series of lines of strings

RULES
EXPLICIT REQUIREMENTS:
  - integer input will always be an odd integer
  - smallest integer input will be 7
  - star always has 8 points and is the same shape
  -
  
IMPLICIT REQUIREMENTS:
  - No negative integers
  - 
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

star(7)    # half n (- 0.5 if a float) is magic number
           # top and bottom of star are half n tall

*  *  *    # line is n asterisks wide, asterisks are at positions 0, half n & -1
 * * *     # asterisks are at positions 1, half n and -2
  ***      # asterisks are at postions 2, halfn and -3
*******    # n asterisks wide - no whitespace
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *


______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Strings
Arrays - to create string pattern first
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Create array of whitespace characters n elements long
  a.
    i.
2. Create top half of star
  a. This grid is n elements long
  b. This grid is half n (-0.5) elements tall
    i.
3. Create central spoke of star
  a. This line is all asterisks and is n elements long
    i.
4. Create bottom half of star
  a. This grid is n elements long
  b. This grid is half n elements tall
  c. The construction process is the reverse of the top half
    i.
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - 

def star(n)
  # top half
  1.upto(n / 2) do |index|
    line = []
    n.times { line << " "}
    line[index - 1].replace('*')
    line[n / 2].replace('*')
    line[-index].replace('*')
    puts line.join
  end
  
  # centre
  puts "*" * n
  
  # bottom half
  (n / 2).downto(1) do |index|
    line = []
    n.times { line << " "}
    line[index - 1].replace('*')
    line[n / 2].replace('*')
    line[-index].replace('*')
    puts line.join
  end
end

# star(7)
# star(9)
star(17)

# -------------------

# solution 2 - 

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases