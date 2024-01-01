=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

INPUT: A string (first_name + " " + last_name)

OUTPUT: A string (last_name + "," + first_name)

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

swap_name('Joe Roberts') == 'Roberts, Joe'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings.  Arrays?
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.Split input_string into new Array of words by whitespace delineator (.split);
2.Return string "#{array[1]} #{array[0]}"
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - 

def swap_name(input_string)
  array = input_string.split
  "#{array[1]}, #{array[0]}"
end

# -------------------

# solution 2 - official LS solution

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

# -------------------

# Print Tests
p swap_name('Joe Roberts') #'Roberts, Joe'

# Test Cases
p swap_name('Joe Roberts') == 'Roberts, Joe'