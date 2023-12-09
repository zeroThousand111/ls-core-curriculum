=begin
________________________________________________________________________________
*****Problem*****

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"
________________________________________________________________________________
Input:
  # What is the form of the data you want to transform?
  
  A Float value
Output:
  # What is the form of the data you want the program to either return or print?
  
  A String
  
Explicit reqs:
  # What does the problem say about what you should do?
  - use a degree symbol (°) to represent degrees;
  - use a single quote (') to represent minutes;
  - use a double quote (") to represent seconds; and
  - I can use the constant DEGREE = "\xC2\xB0" to print the ° symbol
Implicit reqs:
  # What does the problem NOT say about what you need to have covered?
  - How to round decimals
  - If 360° should be represented by '360°00'00"' or '0°00'00"'
________________________________________________________________________________
*****Examples/Test cases*****
________________________________________________________________________________
Test cases:
  # What are some examples of expected outputs for a given input? Be thorough
  dms(30) == %(30°00'00")
  dms(76.73) == %(76°43'48")
  dms(254.6) == %(254°36'00")
  dms(93.034773) == %(93°02'05")
  dms(0) == %(0°00'00")
  dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
________________________________________________________________________________
*****Data structures*****
________________________________________________________________________________
Data manipulation strategy:
  # What forms do your data take on while the program is running?
  
  The initial input Float will be used to generate three Integers:
  - Degrees;
  - Minutes; and
  - Seconds
________________________________________________________________________________
*****Algorithm*****
________________________________________________________________________________
Step-by-step process (plaintext or pseudocode):
  # The logical process by which you intend to tackle the problem at hand
  
  HIGH LEVEL
  1. Calculate degrees and assign to a variable
  2. Calculate minutes and assign to a variable
  3. Calculate seconds and assign to a variable
  4. Output the values of the three variables
  
  DETAIL
  1. CALCULATE DEGREES
    a. Convert input_float to an Integer;
    b. Assign value to degrees;
  2. CALCULATE MINUTES
    a. Assign decimal value of input_float to degree_decimal;
    b. Minutes_decimal is degree_decimal divided by 60
    c. Minutes are minutes_decimal converted to an Integer
  3. CALCULATE SECONDS
    a. Seconds are minutes_decimal devided by 60
    b. Round?  How?
  4. OUTPUT
    a. Interpolate values of variables in string output
    b. Interpolate DEGREE symbol in string;
    c. Insert ' and " minutes and seconds symbols in the output string;
    d. Remember to backslash escape \ the above symbols in the string; and
    e. Format each variable to have leading zeroes. e.g 93°02'05" not 93°2'5".
________________________________________________________________________________
Time to code!
=end

# My Solution

DEGREE = "\xC2\xB0"

def dms(input_float)
  degrees = input_float.to_i
  minutes_decimal = (input_float - degrees) * 60
  minutes = minutes_decimal.to_i
  seconds_decimal = (minutes_decimal - minutes) * 60
  seconds = seconds_decimal.to_i
  "#{degrees}#{DEGREE}#{minutes.to_s.rjust(2, '0')}\'#{seconds.to_s.rjust(2, '0')}\""
end

# Official Solution

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


# print cases
# p dms(30) # %(30°00'00")
# p dms(76.73) # %(76°43'48")
# p dms(93.034773) #%(93°02'05")
p dms(254.6) # %(254°36'00")

# print truth cases - because I'm not sure about why I'm getting falses!
# p %(30°00'00")
# p %(76°43'48")
# p %(254°36'00")

# test cases
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")