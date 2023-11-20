=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

UNDERSTAND THE PROBLEM
INPUT: Integer, positive or negative (number of minutes before/after midnight)
OUTPUT: (hh:mm) A String
RULES:
EXPLICIT REQUIREMENTS:
- May not use Ruby's Date and Time classes 
- Input can be positive or negative Integer

IMPLICIT REQUIREMENTS:
- Input can be more than 24 hours ()
- One (1) means 1 minute
- Integers can be longer than 1440, meaning more than 24 hours

HINTS:
- Integer#divmod may be useful
- Kernel#format may be useful (but it is SO complicated!)

DATA STRUCTURES:

Integer input.  String output.
Maybe that's enough?


ALGORITHM:

1. Turn Integer into hours and minutes and store as variables;
1a. Hours are the quotient of Integer/60.  Minutes are the modulo value.  hours, minutes = Integer.divmod(60)
1b. Account for any multiple of 24 hours. If hours are greater than 24 then hours/24;


IF a positive integer:
a. Create empty string;
b. Prepend minutes to string.  If minutes < 10, prepend an additional 0
c. Prepend a colon ":" to the string;
d. Prepend the hours on to the string.  If hours < 10, prepend an additional 0
e. Return string


IF a negative integer:
a. Create an empty string;
b. Prepend minutes to string (which are the modulo value and already formatted correctly).  If minutes are < 10, prepend an additional 0
c. Prepend a colon ":" to the string;
d. Prepend (24 - hours) on to the string.  If (hours -24 < 10), prepend an additional 0

=end

def time_of_day(integer)
  hours, minutes = integer.divmod(60)
  hours /= 24 if hours.abs > 24
  if integer > 0
    return positive_number(hours, minutes)
  elsif integer < 0
    return negative_number(hours, minutes)
  else
    return "00:00"
  end
end

def positive_number(hours, minutes)
  string = ""
  string.prepend(minutes.to_s)
  string.prepend('0') if minutes < 10
  string.prepend(':')
  string.prepend(hours.to_s)
  string.prepend('0') if hours < 10
  string
end

def negative_number(hours, minutes)
  string = ""
  hours = hours.abs
  string.prepend(minutes.to_s)
  string.prepend('0') if minutes < 10
  string.prepend(':')
  string.prepend((24 - hours.abs).to_s)
  string.prepend('0') if (24 - hours.abs) < 10
  string
end

# Print Tests
# Positive Numbers Between 1 and 1439 - these work fine
# p time_of_day(35) # "00:35"
# p time_of_day(0) # "00:00"
# p time_of_day(90) # "01:30"
# p time_of_day(150) # "02:30"
# p time_of_day(570) # "09:30"
# p time_of_day(630) # "10:30"
# p time_of_day(800) # "13:20"

# Positive Numbers Over 1400
# p time_of_day(3000) # "02:00"

# Negative Numbers
# p time_of_day(-3) # "23:57"
# p time_of_day(-90) # "22:30"
# p time_of_day(-1437) # "00:03"
# p time_of_day(-4231) # "01:29" THIS DOESN'T YET WORK.  IS Test case correct?? Should it not be 21:29?
# p time_of_day(-4321) #20:59

# Test Cases
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29" # I'm quite sure this test case is incorrect and the correct return should be "21:29"
