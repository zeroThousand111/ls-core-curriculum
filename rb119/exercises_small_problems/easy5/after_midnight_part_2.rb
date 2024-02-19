=begin
______________________________________________________________________________
*****Understand the PROBLEM*****
______________________________________________________________________________
THE PROBLEM:

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

INPUT: A numeric time string hh:mm

OUTPUT: An Integer (minutes before or after midnight)

RULES
EXPLICIT REQUIREMENTS:
  - You may not use ruby's Date and Time methods.
  - Two methods
  - Both methods should return a value in the range 0..1439.
  
IMPLICIT REQUIREMENTS:
  - Test cases include '00:00' == 0
  - By definition, none of the test cases are more than 24 hours away from midnight
  -

______________________________________________________________________________
*****EXAMPLES/TEST CASES*****
______________________________________________________________________________

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

______________________________________________________________________________
*****DATA STRUCTURES*****
______________________________________________________________________________

Strings and Integers
______________________________________________________________________________
*****ALGORITHM*****
______________________________________________________________________________

AFTER MIDNIGHT

1.CONVERT string values to hours and minutes
  a.hours is string[0..1], minutes is string[3..4]
  b.String#to_i is allowed
    i.hours = string[0..1].to_i
2.NORMALISE hours to one day (one test case is '24:00')
  a. if hours is 24 or more than 24, then normalise it to one day
    i. hours = hours % 24 - such a useful operation!
3.CALCULATE minutes after
  a.Minutes after is (hours * 60) + minutes
    i.(hours * 60) + minutes
    
    
BEFORE MIDNIGHT

1.CONVERT string values to hours and minutes
  a.hours is string[0..1], minutes is string[3..4]
  b.String#to_i is allowed
    i.hours = string[0..1].to_i
2.NORMALISE hours to one day
  a. if hours is 24 or more than 24, then normalise it to one day
    i. hours = hours % 24 - such a useful operation!
3.CALCULATE hours before midnight
  a. at 23:01 - 24:00 hours is zero, at 22:01-23:00 hours is 1, etc
  b. This means number of hours before midnight is 23 - 'hh' unless hours is zero
    i. hours = 23 - hours 
4.Calculate minutes after the last full hour
  a. if minutes is not zero, then minutes is 60 - minutes
  i. minutes = 60 - minutes
5.CALCULATE minutes before midight
  a.Minutes after is (hours * 60) + minutes
    i.

______________________________________________________________________________

Now CODE with intent!
=end

require 'pry'
require 'pry-byebug'

# solution 1 - Using string element assignment and String#to_i

def after_midnight(string)
  hours, minutes = string[0..1].to_i, string[3..4].to_i
  hours = hours % 24
  (hours * 60) + minutes
end

def before_midnight(string)
  # binding.pry
  hours, minutes = string[0..1].to_i, string[3..4].to_i
  hours = hours % 24
  if hours != 0
    hours = 23 - hours
  end
  # hours = hours 23 - hours
  if minutes != 0
      minutes = 60 - minutes
  end
  # minutes = 60 - minutes
  (hours * 60) + minutes
end

# -------------------

# solution 2 - Official LS solution

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

# -------------------

# solution 3 - 

# -------------------

# solution 4 - 

# -------------------

# solution 5 - 

# -------------------

# Print Tests
# p after_midnight('12:34')  # 754


# p before_midnight('12:34') # 686
# p before_midnight('23:30') # 30
# p before_midnight('22:30') # 90

# Test Cases
p after_midnight('00:00') == 0
p after_midnight('24:00') == 0
p after_midnight('12:34') == 754

p before_midnight('12:34') == 686
p before_midnight('24:00') == 0
p before_midnight('00:00') == 0