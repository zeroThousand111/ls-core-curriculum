=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
=end

=begin

MY LOGIC

IF the year is before (less than) 1752

ELSE Julian Calendar logic which is the same as PART 1:
1. Leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100; OR
2. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400
In other words:
(year evenly divisible by 4) AND (year NOT evenly divisible by 100) 
OR 
(year evenly divisble by 100) AND (year evenly divisible by 400)

=end

def leap_year?(num)
  if num < 1752
    num % 4 == 0
  else
    ((num % 4 == 0) && !(num % 100 == 0)) || ((num % 400 == 0) && (num % 100 == 0))
  end
end

# print tests
# p leap_year?(1700) # true
# p leap_year?(1752) # true
# p leap_year?(2000) # true

# truth tests
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true