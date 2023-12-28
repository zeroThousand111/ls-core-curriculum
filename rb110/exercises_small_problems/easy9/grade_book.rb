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
0 <= score < 60	'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

INPUT: 3 Integer arguments

OUTPUT: A string

RULES
EXPLICIT REQUIREMENTS:
  - A letter that matches the average score of three grades
  - Tested values are all between 0 and 100.
  -
  
IMPLICIT REQUIREMENTS:
  - No non-number;
  - Always three arguments;
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Array
Case statement
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1. Sum the three arguments;
2. Divide the sum by 3 to get the average score;
3. Compare average score with grade table
4. Return grade string
5.
______________________________________________________________________________

Now CODE with intent!
=end

# solution 1 - IF statement

# def get_grade(score1, score2, score3)
#   sum = score1 + score2 + score3
#   average_score = sum / 3
  
#   if average_score >= 90
#     "A"
#   elsif average_score >= 80 && average_score < 90
#     "B"
#   elsif average_score >= 70 && average_score < 80
#     "C"
#   elsif average_score >= 60 && average_score < 70
#     "D"
#   else
#     "E"
#   end
  
# end

# -------------------

# solution 2 - a case statement

def get_grade(score1, score2, score3)
  average_score = (score1 + score2 + score3) / 3
  
  case average_score
  when 90..100
    "A"
  when 80..89 
    "B"
  when 70..79
    "C"
  when 60..69
    "D"
  else
    "E"
  end
  
end

# -------------------

# Print Tests
# p get_grade(95, 90, 93) #"A"
# p get_grade(50, 50, 95) #"D"

# Test Cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"