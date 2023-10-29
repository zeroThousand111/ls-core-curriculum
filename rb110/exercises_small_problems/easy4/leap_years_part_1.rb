=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.
=end

=begin
MY LOGIC
1. Leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100; OR
2. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400

In other words:

(year evenly divisible by 4) AND (year NOT evenly divisible by 100) 

OR 

(year evenly divisble by 100) AND (year evenly divisible by 400)

=end


def leap_year?(num)
  ((num % 4 == 0) && !(num % 100 == 0)) || ((num % 400 == 0) && (num % 100 == 0))
end

# print tests
# p leap_year?(2016)
# p leap_year?(2015)

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
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true