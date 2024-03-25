=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

INPUT: an Integer

OUTPUT: an Integer

RULES
EXPLICIT REQUIREMENTS:
  - a "featured number":
    - is odd;
    - is a multiple of 7; AND
    - doesn't have two digits of the same type.
  
IMPLICIT REQUIREMENTS:
  - numbers of a size beyond 10 digits long cannot be a 'featured number', because they will have to repeat at least one digit, so any number above 9_999_999_999 should return an error message.

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Arrays might be useful to determine if digits repeat
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CREATE an array of the digits of the Integer argument
  a.
    i.array = input.digits.reverse
2.Return an ERROR message if the array size exceeeds 10 digits
3.TEST if the current number is a 'featured number'
  a.Return FALSE if the input value is not odd
    i. value.odd?
  b.Return FALSE if the input value is not a multiple of 7
    i. value % 7 == 0
  c.Return FALSE if there are multiple digits of the same type 
  e.Return the current number if none of the above tests trigger a false return
3.Add 1 to the current number
  a.
    i.
4.REPEAT steps in 2-3 until a value is returned
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

# solution 1 - using a loop to move through numbers and three next statements to "defend" a break statement

def featured(num)
  current_num = num
  array = num.digits.reverse
  return "There is no possible number that fulfills those requirements" if array.size > 9
  
  loop do 
    current_num += 1
    array = current_num.digits.reverse
    next if !current_num.odd?
    next if current_num % 7 != 0
    next if array.size != array.uniq.size
    break
  end
  
  current_num
end

# -------------------

# solution 2 - official LS solution

def featured(number)
  number += 1 # move number up 1, in case number is already a 'featured number'
  number += 1 until number.odd? && number % 7 == 0 # move up to a number that is both odd and divisible by 7

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests

# Test Cases

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements