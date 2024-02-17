=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

INPUT: An Integer

OUTPUT: A String

RULES
EXPLICIT REQUIREMENTS:
  - Format is century number + suffix (st, nd, rd, th)
  - New centuries begin in years that end with 01
  - 
  
IMPLICIT REQUIREMENTS:
  - Centuries 11th-13th have different than normal suffixes (compared to 1st-3rd or 21st-23rd for example)
  - No restrictions on conversion methods for this problem!
  - A century is one hundred years

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Maybe arrays?
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.CALCULATE quotient and modulo value when dividing Integer by 100 to get approx century and remainder and capture each in a local variable
  a. 
    i.century, years_in_century = integer.divmod(100)
2.INCREMENT century if the remainder from step 1 is more than zero
  a.
    i.century += 1 if years_in_century > 0
3.CREATE appropriate suffix for the string
  a.Could use a case statement based upon the value of century
  b.The challenge is centuries with 11, 12 & 13, because they are not suffixed with st, nd, rd, they have th!  This includes the 111th century and the 211th century etc (not 111st or 211st)
  c.Integer#digits creates a reversed array of the digits
  d.Logic can be: if array[0] == 1 && array[1] == 1 then 'th'
    i.if array[0] == 1 && array[1] == 1 then 'th'
    ii. if array[0] == 1 && array[1] != 1 then 'st'
    iii. etc
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

# solution 1 - 

def century(integer)
  century, years_in_century = integer.divmod(100)
  century += 1 if years_in_century > 0
  
  suffix = case 
           when century.digits[0] == 1 && century.digits[1] != 1 then 'st'
           when century.digits[0] == 2 && century.digits[1] != 1 then 'nd'
           when century.digits[0] == 3 && century.digits[1] != 1 then 'rd'
          # when century.digits[0] == 1 && century.digits[1] == 1 then 'th'
          # when century.digits[0] == 2 && century.digits[1] == 1 then 'th'
          # when century.digits[0] == 3 && century.digits[1] == 1 then 'th'
           else 'th'
           end

  century.to_s + suffix
end

# -------------------

# solution 2 - Official LS solution

# def century(year)
#   century = year / 100 + 1
#   century -= 1 if year % 100 == 0
#   century.to_s + century_suffix(century)
# end

# def century_suffix(century)
#   return 'th' if [11, 12, 13].include?(century % 100)
#   last_digit = century % 10

#   case last_digit
#   when 1 then 'st'
#   when 2 then 'nd'
#   when 3 then 'rd'
#   else 'th'
#   end
# end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p century(2000) # '20th'
# p century(2001) # '21st'
# p century(1052) # '11th'

# Test Cases
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'