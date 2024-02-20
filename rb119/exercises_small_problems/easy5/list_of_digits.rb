=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

INPUT:

OUTPUT:

RULES
EXPLICIT REQUIREMENTS:
  - 
  -
  -
  
IMPLICIT REQUIREMENTS:
  -
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Weirdly, a String
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CONVERT integer into a numeric string
  a.
    i.integer.to_s
2.CREATE an empty array
  a.
    i.array = []
3.PUSH every character of the numeric string to the array
  a.Use a simple loop to iterate through the string
  b.Use shovel << method to push each character to the new array
    i.
4.CONVERT every numeric character back into an integer
  a.
    i.
5.RETURN the array
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using a simple loop through a numeric string 

def digit_list(integer)
  numeric_string = integer.to_s
  array = []
  index = 0
  
  loop do 
    array << numeric_string[index].to_i
    index += 1
    break if index == numeric_string.length
  end
  array
end

# -------------------

# solution 2 - the smart-ass way

def digit_list(integer)
  integer.digits.reverse
end


# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p digit_list(12345) # [1, 2, 3, 4, 5]     # => true

# Test Cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true