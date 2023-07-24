=begin
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.
=end

# def leap_year?(year)
#   if year % 4 == 0 && year % 100 != 0
#     true
#   elsif year % 4 == 0 && year % 400 == 0
#     true
#   else
#     false
#   end
# end

# Further Exploration
# The order in which you perform tests for a leap year calculation is important. For what years will `leap_year?` fail if you rewrite it as:

# def leap_year?(year)
#   if year % 100 == 0
#     false
#   elsif year % 400 == 0
#     true
#   else
#     year % 4 == 0
#   end
# end

## Further Further Exploration:
def leap_year?(year)
  if year % 4 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else    
  end
end

# tests
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