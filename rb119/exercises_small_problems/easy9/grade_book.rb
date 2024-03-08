=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60

INPUT: three Integer arguments

OUTPUT: a String

RULES
EXPLICIT REQUIREMENTS:
  - three scores always input
  -
  -
  
IMPLICIT REQUIREMENTS:
  - the three Integer inputs will need to be averaged; it is the mean value that is required, not mode or median
  -
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________
Maybe an array?
A case statement
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

# solution 1 - using an IF statement

def get_grade(num1, num2, num3)
  average = (num1 + num2 + num3) / 3
  if average >= 90
    'A'
  elsif average >=80 && average < 90
    'B'
  elsif average >=70 && average < 80
    'C'
  elsif average >=60 && average < 70
    'D'
  else
    'E'
  end
end

# -------------------

# solution 2 - official LS solution using case statement and Range values

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
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
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"