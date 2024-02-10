=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

INPUT: An Integer

OUTPUT: An Integer

RULES
EXPLICIT REQUIREMENTS:
  - What is a "featured number"?
    - An odd number; and
    - A multiple of 7; and
    - Whose digits occur exactly once
  - Return is:
    - The next 'featured number', OR
    - An error message if there is no next featured number.
  -
  
IMPLICIT REQUIREMENTS:
  - A very high number with 11 or more digits will fail the third criteria of being a featured number because one digit at least will be repeated in the long number (there are only 10 possible digits that can be used)
  -
  -

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

An array
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CREATE a test number, starting with the argument
  a. Test number will be initialised as parameter
    i.test_no = input_no
2.Increment the test number number by one
  a. Use abbreviated assignment
    i. test_no += 1
3.TEST if the number is a featured number, if yes, return the number
  a. is the number odd?
    i. test_no.odd?
  b. is the number divisible by 7?
    i. test_no % 7 == 0
  c. does the number contain unrepeated digits?
    i.
4.REPEAT steps 2-3 above until the test number is a featured number, OR PRINT an error message (because you've gone into 10 digit numbers)
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - My solution with a simple loop

def featured_no?(test_no)
  test_no.odd? && test_no % 7 == 0 && test_no.digits.size == test_no.digits.uniq.size
end

def featured(test_no)
  loop do
    test_no +=1
    break if featured_no?(test_no)
    if test_no.digits.size > 10
      puts "There is no possible number that fulfills those requirements"
      return nil
    end
  end
  test_no
end

# -------------------

# solution 2 - Official LS Solution
# def featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = number.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end

#   'There is no possible number that fulfills those requirements.'
# end

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