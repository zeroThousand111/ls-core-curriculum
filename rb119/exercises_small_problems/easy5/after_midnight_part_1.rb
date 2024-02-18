=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

INPUT: An integer (minutes)

OUTPUT: A numeric string representing time in 24 hour hh:mm format

RULES
EXPLICIT REQUIREMENTS:
  - Your method should work with any integer input.
  - If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.
  - You may not use ruby's Date and Time classes.
  -
  
IMPLICIT REQUIREMENTS:
  - No non-Integer input or empty input
  - I can use Integer#to_s
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Maybe none.  Just integers and strings
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

1.TRANSFORM any negative input to positive for next step
  a. Use the Integer#abs method to make positive any negative number
    i. integer.abs
2.CALCULATE how many days and minutes the Integer minutes is for the 24 hour clock N.B. 24 hours is 1440 minutes
  a. Divide the positive integer by 1440 and retain the remainder, which is the minutes left over after full days
  b. We can discount the number of days; we are only concerned with the minutes
    i. _, minutes = integer.divmod(1440)
3.CALCULATE the hours and minutes equivalent to the remainder Integer (minutes)
  a. Divide the positive integer by 60 and retain the quotient (hours) and the remainder (minutes)
  b. Use Integer#divmod and multiple parallel assignment of two variables
    i. hours, minutes = integer.divmod(60)
4.CALCULATE the value of negative integer
  a.negative hours is 23 minus hours value
  b.negative minutes is 60 minus minutes value
    i.
4.CREATE and FORMAT the output string
  a.Kernel#format can insert leading zeroes where the values of hours and minutes are in single digits e.g. 0, 3 becomes '00:03'
    i.sprintf('%.2d', hours)
5.
  a.
    i.
______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - My first attempt

# def time_of_day(integer)
#   abs_integer = integer.abs
#   _, remainder = abs_integer.divmod(1440)
#   hours, minutes = remainder.divmod(60)
  
#   if integer < 0
#     hours = 23 - hours
#     minutes = 60 - minutes
#   end
  
#   "#{sprintf('%.2d', hours)}:#{sprintf('%.2d', minutes)}"
# end

# -------------------

# solution 2 - Official LS Solution

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end

#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# -------------------

# solution 3 - My solution using neater formatting syntax from official LS solution

# def time_of_day(integer)
#   abs_integer = integer.abs
#   _, remainder = abs_integer.divmod(1440)
#   hours, minutes = remainder.divmod(60)
  
#   if integer < 0
#     hours = 23 - hours
#     minutes = 60 - minutes
#   end
  
#   format('%02d:%02d', hours, minutes)
# end

# -------------------

# solution 4 - Using a different algorithm with a much more smart ass way of using a modulo value (negative numbers give the correct negative hours value)

def time_of_day(integer)
  hours, minutes = integer.divmod(60)
  hours = hours % 24 # the power of modulo value in this problem
  format('%02d:%02d', hours, minutes)
end

# -------------------

# solution 5 - 

# -------------------

# Print Tests
p time_of_day(800) # "13:20"
p time_of_day(-3)  # "23:57"
p time_of_day(0)   # "00:00"

# Test Cases
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"