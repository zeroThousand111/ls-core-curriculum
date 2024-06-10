=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

 # UNDERSTAND THE PROBLEM
 
 ## Input: an integer, n
 ## Output: a series of strings that create a 4-pointed diamond in an n x n sized grid
 ## Rules:
 ### Explicit requirements:
  - n is always an odd integer
  - 
  
 ### Implicit requirements:
  - the grid is sized n whitespace characters tall by n whitespace wide
  - an argument of 1 can be expected
  - an argument of 0 is not expected, because it is not an odd integer
  - 
 
 # TEST CASES / EXAMPLES
 
 diamond(1)
*

diamond(3)
 *
***
 *

diamond(9)
    *     # 4 ws, 1 *
   ***    # 3 ws, 3 *
  *****   # 2 ws, 5 *
 *******  # 1 ws, 7 *
*********
 *******
  *****
   ***
    *

# DATA STRUCTURES
strings

# ALGORITHM

* PRINT a triangle of asterisks, with apex north
  + triangle sits in a rectangle n characters wide and (n / 2) rounded down characters tall
  + topmost line always has ((n / 2 rounded down) / 2) + 1whitespaces then one "*" 
  + next line has ((n / 2 rounded down) / 2) whitespaces then three "*"
  + and so on, until asterisks are n - 2 and/or whitespace is 
  + could use a helper method
* PRINT a line of n asterisks
  + create and print a string of n asterisks
    - puts "*" * n
* PRINT a triangle of asterisks, with apex south

=end

def top_triangle(n)
  return if n == 1
  asterisk = 1
  whitespace = (n - 2) / 2 + 1
  loop do
    puts (" " * whitespace) + ("*" * asterisk)
    asterisk += 2
    whitespace -= 1
    break if asterisk == n
  end
end

def bottom_triangle(n)
  return if n == 1
  asterisk = n - 2
  whitespace = 1
  loop do
    puts (" " * whitespace) + ("*" * asterisk)
    asterisk -= 2
    whitespace += 1
    break if asterisk <= 0
  end
end

def diamond(n)
  top_triangle(n)
  puts "*" * n
  bottom_triangle(n)
end


diamond(1)
diamond(3)
diamond(9)