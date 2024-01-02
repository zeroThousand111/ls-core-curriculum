=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Complete Rotate Part 1 for strings.

Complete Rotate Part 1 for Integers.

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



______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.
2.
3.
4.
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - Rotate Part 1 for Arrays

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# p rotate_array(['a', 'b', 'c']) #['b', 'c', 'a']

# -------------------

# solution 2 - Rotate Part 1 for Strings

# def rotate_string(string)
#   string[1..-1] + string[0]
# end

# p rotate_string('hello') #'ohell'
# p rotate_string('hi') #'ih'

# -------------------

# solution 3 - Rotate Part 1 for Integers

=begin
1. Convert integers to strings
2. 
3.
4.
=end

def rotate_integer(integer)
  string = integer.to_s
  (string[1..-1] + string[0]).to_i
end

p rotate_integer(12345) #23451
p rotate_integer(100) #001 aka 1

# -------------------

# Print Tests

# Test Cases