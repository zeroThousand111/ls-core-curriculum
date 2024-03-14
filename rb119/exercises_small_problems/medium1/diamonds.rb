=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Further Exploration
Try modifying your solution or our solution so it prints only the outline of the diamond:

diamond(5)

  *
 * *
*   *
 * *
  *
  

INPUT: an Integer

OUTPUT: a series of string lines made of * characters that make the geometric shape of a diamond

RULES
EXPLICIT REQUIREMENTS:
  - the output is a grid
  -
  -
  
IMPLICIT REQUIREMENTS:
  - the grid includes whitespace either side of the *
  - the height of the diamond is the same as the Integer arguent
  - the top and bottom of the diamond are two triangles made of strings and whitespace
  - each triangle is (n / 2), rounded down, lines tall
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

    *      # 4 leading whitespace, 1 *
   ***     # 3 leading whitespace, 3 *
  *****    # 2 leading whitespace, 5 *
 *******   # 1 leading whitespace, 7 *
*********  # 0 leading whitespace, 9 *
 *******   # 1 leading whitespace, 7 *
  *****    # 2 leading whitespace, 5 *
   ***     # 3 leading whitespace, 3 *
    *      # 4 leading whitespace, 1 *

FURTHER EXPLORATION

diamond(5)

  *        # 2 leading whitespace, 1 *
 * *       # 1 leading whitespace, 1 *, 1 middle whitespace, 1 *
*   *      # 0 leading whitespace, 1 *, 3 middle whitespace, 1 *
 * *
  *

diamond(9)
    *      # 4 leading whitespace, 1 *  (0 middle whitespace)
   * *     # 3 leading whitespace, 1 *, 1 middle whitespace, 1 *
  *   *    # 2 leading whitespace, 1 *, 3 middle whitespace, 1 *
 *     *   # 1 leading whitespace, 1 *, 5 middle whitespace, 1 *
*       *  # 0 leading whitespace, 1 *, 7 middle whitespace, 1 *
 *******   # 1 leading whitespace, 7 *
  *****    # 2 leading whitespace, 5 *
   ***     # 3 leading whitespace, 3 *
    *      # 4 leading whitespace, 1 *

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


1.
  a.
    i.
2.
  a.
    i.
3.
  a.
    i.
4.OUTPUT the middle line of strings with the 
  a.Width is the same as the integer
    i.puts "*" * n
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - using simple loops to construct the triangles

# def diamond(n)
#   puts "*" if n == 1
#   return if n == 1
  
#   # top triangle
#   asterix = 1
#   whitespace = n / 2
#   loop do
#     puts (" " * whitespace) + ("*" * asterix)
#     asterix += 2
#     whitespace -= 1
#     break if whitespace == 0
#   end
  
#   # middle line
#   puts "*" * n
  
#   # bottom triangle
#   whitespace = 1
#   asterix = n - 2
#   loop do
#     puts (" " * whitespace) + ("*" * asterix)
#     break if asterix == 1
#     asterix -= 2
#     whitespace += 1
#   end
# end

# -------------------

# solution 2 - using upto and downto

# def diamond(n)
#   half = n / 2
  
#   # top triangle
#   1.upto(half) do |i|
#     puts (" " * (half - i + 1)) + ("*" * (i*2 - 1))
#   end
  
#   # middle line
#   puts "*" * n
  
#   # bottom triangle
#   half.downto(1) do |i|
#     puts (" " * (half - i + 1)) + ("*" * (i*2 - 1))
#   end
# end

# -------------------

# solution 3 - FURTHER EXPLORATION

def diamond(n)
  puts "*" if n == 1
  return if n == 1
  
  # top tip of triangle
  leading_whitespace = n / 2
  puts (" " * leading_whitespace) + "*"
  leading_whitespace -= 1
  # rest of top triangle
  middle_whitespace = 1
  loop do
    break if leading_whitespace == 0
    puts (" " * leading_whitespace) + "*" + (" " * middle_whitespace) + "*"
    middle_whitespace += 2
    leading_whitespace -= 1
  end
  # middle line
  puts "*" + (" " * (n - 2)) + "*"
  # rest of bottom triangle
  middle_whitespace -= 2
  leading_whitespace = 1
  loop do
    break if leading_whitespace == n / 2
    puts (" " * leading_whitespace) + "*" + (" " * middle_whitespace) + "*"
    middle_whitespace -= 2
    leading_whitespace += 1
  end
  # bottom tip of triangle
  puts (" " * leading_whitespace) + "*"
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
diamond(9)
diamond(5)
diamond(3)
diamond(1)

# Test Cases