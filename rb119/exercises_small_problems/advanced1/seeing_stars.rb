=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - an 8-pointed star in an nxn grid
  - smallest star is 7x7 grid (n = 7)
  - n is always odd
  
IMPLICIT REQUIREMENTS:
  - grid is n characters wide
  - grid is n characters tall
  - 8-pointed star could be described as two inverted triangles above and below a line of asterisks n length

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

star(7)

*  *  *  | 0 * 2 * 2 * 0 
 * * *   | 1 * 1 * 1 * 1
  ***    | 2 * 0 * 0 * 2
*******
  ***
 * * *
*  *  *

star(9)

*   *   * | 0 * 3 * 3 * 0 
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

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.OUTPUT top triangle
  a.triangle is (n / 2) - 0.5 lines tall
  b.loop somehow to generate (n / 2) -0.5 lines
  c.each line will contain 3 asterisks, separated by white space characters
  d.
    i.
2.OUTPUT middle line
  a.
    i.puts "*" * n
3.OUTPUT bottom triangle 
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

# solution 1 - triangle lines created with simple loops

def star(n)
  # top triangle
  outer_white_space = 0
  inner_white_space = (n / 2) - 1
  loop do
    puts (" " * outer_white_space) + "*" + (" " * inner_white_space) + "*" + (" " * inner_white_space) + "*"
    outer_white_space += 1
    inner_white_space -= 1
    break if outer_white_space == n / 2
  end
  
  # middle line
  puts "*" * n
  
  # bottom triangle
  outer_white_space = (n / 2) - 1
  inner_white_space = 0
  loop do
    puts (" " * outer_white_space) + "*" + (" " * inner_white_space) + "*" + (" " * inner_white_space) + "*"
    outer_white_space -= 1
    inner_white_space += 1
    break if outer_white_space < 0
  end
  
end

# -------------------

# solution 2 - using #upto and #downto



# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
star(7)
star(9)

# Test Cases