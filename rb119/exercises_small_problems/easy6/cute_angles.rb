=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

INPUT: A float

OUTPUT: A numerical string

RULES
EXPLICIT REQUIREMENTS:
  - string format is 321°03'07" - note leading zeroes
  - 
  -
  
IMPLICIT REQUIREMENTS:
  - No angle greater than 360 in the test cases
  - Zero degrees is included in the test cases
  - the number is a float not an integer, even if input is originally an integer

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________
1. Requirement — The important, generalized steps required to navigate from the input to the desired output.
  a. Approach — The process that will be utilized to accomplish each Requirement.
    i. Procedure — Specific details to implement the Approach.


1.CONVERT input number to a float (if not already a float)
  a.
    i. float = num.to_f
2.CALCULATE the equivalent degrees, minutes and arcs for the input number
  a.Degrees = whole number (ignore decimals)
    i.degrees, minutes_remainder = float.divmod(1)
  b.Minutes = decimals * 60
    i.minutes, seconds_remainder = (minutes_remainder * 60).divmod(1)
  c.Seconds = minutes * 60
    i.seconds = seconds_remainder * 60
3.CREATE a formatted string with the calculated values of degrees, minutes and seconds
  a.Use Kernel#format aka Kernel#sprintf
    i.sprintf('degree')
    
FURTHER EXPLORATION LOGIC

4.If num > 360 
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

# DEGREE = "\xC2\xB0"

# solution 1 - My solution

# def dms(num)
#   float = num.to_f
#   # binding.pry
#   degrees, minutes_remainder = float.divmod(1)
#   minutes, seconds_remainder = (minutes_remainder * 60).divmod(1)
#   seconds = seconds_remainder * 60
#   "#{degrees}#{DEGREE}#{sprintf('%.2d', minutes)}\'#{sprintf('%.2d', seconds)}\""
# end

# -------------------

# solution 2 - Official LS Solution, but the maths is different to the hint link and different to my PEDA logic too

# DEGREE = "\xC2\xB0"
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_MINUTE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

# def dms(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# -------------------

# solution 3 - LS solution refactored so that I can understand better

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = 3600

def dms(num)
  # binding.pry
  degrees_float = (num.abs % 3600)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  if num >= 0
    format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  else
    format(%(-#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  end
end

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# puts dms(76.73) # %(76°43'48")
# puts dms(93.034773) # %(93°02'05")
# puts dms(254.6) # %(254°36'00")

# Test Cases
# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration Test Cases
puts dms(400) == %(400°00'00")
puts dms(-40) == %(-40°00'00")
puts dms(-420) == %(-420°00'00")

# puts dms(-40)  # %(-40°00'00")
# puts dms(-420) # %(-420°00'00")